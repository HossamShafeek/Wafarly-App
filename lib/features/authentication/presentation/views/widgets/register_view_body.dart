import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/config/local/cache_helper.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/core/widgets/logo_text_widget.dart';
import 'package:wafarly/core/widgets/title_and_text_button.dart';
import 'package:wafarly/features/authentication/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/register_cubit/register_state.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/register_texts_fields_section.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:gap/gap.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is RegisterSuccessState) {
          CacheHelper.setString(key: 'userId', value: state.user.uid);
          AppConstants.userId = state.user.uid;
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.layoutView, (route) => false);
          showSuccessSnackBar(
              context: context, message: 'تم تسجيل الدخول بنجاح');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoadingState,
          color: Colors.white,
          opacity: 0.5,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.defaultPadding),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: LogoTextWidget()),
                    const Gap(50),
                    const TitleAndSubtitle(
                      subtitle: AppStrings.signUpSubtitle,
                      title: AppStrings.createNewAccount,
                    ),
                    const RegisterTextsFieldsSection(),
                    CustomElevatedButton(
                      onPressed: () {
                        if (RegisterCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          RegisterCubit.get(context)
                              .registerWithEmailAndPassword();
                        }
                      },
                      title: AppStrings.createAccount,
                    ),
                    TitleAndTextButton(
                      title: AppStrings.doYouAlreadyHaveAnAccount,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      titleForButton: AppStrings.signIn,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
