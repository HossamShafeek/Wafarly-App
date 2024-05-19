import 'package:flutter/material.dart';
import 'package:wafarly/config/routes/app_routes.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/title_and_text_button.dart';
import 'package:wafarly/features/menu/presentation/views/widgets/menu_item_widget.dart';

class NoProfileSection extends StatelessWidget {
  const NoProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MenuItemWidget(
          paddingForTop: 0,
          title: AppStrings.account,
          subtitle: AppStrings.youAreNotLoggedInYet,
        ),
        TitleAndTextButton(
          title: AppStrings.doYouWantToLogin,
          onPressed: () {
            Navigator.pushNamed(context, Routes.loginView);
          },
          titleForButton: AppStrings.signIn,
        ),
      ],
    );
  }
}