import 'package:flutter/material.dart';
import 'package:wafarly/core/widgets/custom_back_button.dart';
import 'package:wafarly/features/authentication/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: const LoginViewBody(),
    );
  }
}
