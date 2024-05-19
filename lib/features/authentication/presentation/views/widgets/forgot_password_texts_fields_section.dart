import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:wafarly/features/authentication/presentation/cubits/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordTextsFieldsSection extends StatelessWidget {
  const ForgotPasswordTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return Form(
          key: ForgotPasswordCubit.get(context).formKey,
          child: Column(
            children: [
              CustomTextField(
                textInputType: TextInputType.emailAddress,
                controller: ForgotPasswordCubit.get(context).emailController,
                prefixIcon: Icon(
                  IconBroken.Message,
                  size: AppConstants.iconSize18,
                  color: AppColors.primary,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.pleaseEnterYourEmail;
                  }
                  return null;
                },
                title: AppStrings.email,
                hintText: AppStrings.enterYourEmail,
              ),
            ],
          ),
        );
      },
    );
  }
}
