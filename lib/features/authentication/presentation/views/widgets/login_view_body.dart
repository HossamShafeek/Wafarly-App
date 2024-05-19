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
import 'package:wafarly/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/login_cubit/login_state.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/login_texts_fields_section.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/title_and_subtitle.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          showErrorSnackBar(context: context, message: state.error);
        } else if (state is LoginSuccessState) {
          CacheHelper.setString(key: 'userId', value: state.user.uid);
          CacheHelper.setString(
              key: 'userType',
              value: LoginCubit.get(context).userModel!.userType);
          AppConstants.userId = state.user.uid;
          AppConstants.userType = LoginCubit.get(context).userModel!.userType;
          if(LoginCubit.get(context).userModel!.userType=='user'){
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.layoutView, (route) => false);
          }else{
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.adminLayoutView, (route) => false);
          }
          showSuccessSnackBar(
              context: context, message: 'تم تسجيل الدخول بنجاح');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
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
                      subtitle: AppStrings.signInSubtitle,
                      title: AppStrings.signIn,
                    ),
                    const LoginTextsFieldsSection(),
                    TitleAndTextButton(
                      title: AppStrings.didYouForgetYourPassword,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotPassword);
                      },
                      titleForButton: AppStrings.resetPassword,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (LoginCubit.get(context)
                            .formKey
                            .currentState!
                            .validate()) {
                          LoginCubit.get(context).loginWithEmailAndPassword();
                        }
                      },
                      title: AppStrings.signIn,
                    ),
                    TitleAndTextButton(
                      title: AppStrings.doNotHaveAnAccount,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.registerView);
                      },
                      titleForButton: AppStrings.createNewAccount,
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
