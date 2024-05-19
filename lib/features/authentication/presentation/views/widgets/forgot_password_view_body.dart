import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:wafarly/core/functions/show_snack_bar.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_elevated_button.dart';
import 'package:wafarly/core/widgets/logo_text_widget.dart';
import 'package:wafarly/core/widgets/title_and_text_button.dart';
import 'package:wafarly/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/forgot_password_texts_fields_section.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:gap/gap.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          showSuccessSnackBar(context: context, message: state.message);
          Navigator.pop(context);
        }
     },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ForgotPasswordLoadingState,
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
                    Gap(AppConstants.size30h),
                    const Center(child: LogoTextWidget()),
                    const Gap(50),
                    const TitleAndSubtitle(
                      subtitle: AppStrings.forgotPasswordSubtitle,
                      title: AppStrings.resetPassword,
                    ),
                    const ForgotPasswordTextsFieldsSection(),
                    CustomElevatedButton(
                      onPressed: () {
                        if (ForgotPasswordCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          ForgotPasswordCubit.get(context).resetPassword();
                        }
                      },
                      title: AppStrings.resetPassword,
                    ),
                    TitleAndTextButton(
                      title: AppStrings.didYouRememberYourPassword,
                      onPressed: (){
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
