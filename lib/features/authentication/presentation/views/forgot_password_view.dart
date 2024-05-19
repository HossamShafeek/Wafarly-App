import 'package:flutter/material.dart';
import 'package:wafarly/core/widgets/custom_back_button.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/forgot_password_view_body.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      resizeToAvoidBottomInset: false,
      body: const ForgotPasswordViewBody(),

    );
  }
}