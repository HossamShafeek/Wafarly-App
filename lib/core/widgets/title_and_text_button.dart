import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_styles.dart';
import 'package:wafarly/core/widgets/custom_text_button.dart';

class TitleAndTextButton extends StatelessWidget {
  const TitleAndTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.titleForButton,
     this.paddingForTop,
     this.paddingForBottom,
  });

  final String title;
  final String titleForButton;
  final void Function() onPressed;
  final double? paddingForTop;
  final double? paddingForBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingForTop??0,
        bottom: paddingForBottom??0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.styleRegular14Grey,
          ),
          CustomTextButton(
            onPressed: onPressed,
            title: titleForButton,
          ),
        ],
      ),
    );
  }
}
