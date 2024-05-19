import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_strings.dart';
import 'package:wafarly/core/widgets/custom_text_field.dart';
import 'package:wafarly/features/menu/presentation/cubits/about_cubit/about_cubit.dart';

class UpdateAboutDataTextsFields extends StatefulWidget {
  const UpdateAboutDataTextsFields({super.key});

  @override
  State<UpdateAboutDataTextsFields> createState() =>
      _UpdateAboutDataTextsFieldsState();
}

class _UpdateAboutDataTextsFieldsState extends State<UpdateAboutDataTextsFields> {
  @override
  void initState() {
    AboutCubit.get(context).chatLinkController.text =
        AboutCubit.get(context).aboutModel.chatLink;
    AboutCubit.get(context).appLinkController.text =
        AboutCubit.get(context).aboutModel.appLink;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textInputType: TextInputType.text,
          controller: AboutCubit.get(context).chatLinkController,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.pleaseEnterChatLink;
            }
            return null;
          },
          title: AppStrings.chatLink,
          hintText: AppStrings.enterChatLink,
        ),
        CustomTextField(
          textInputType: TextInputType.text,
          controller: AboutCubit.get(context).appLinkController,
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.pleaseEnterAppLink;
            }
            return null;
          },
          title: AppStrings.appLink,
          hintText: AppStrings.enterAppLink,
        ),
      ],
    );
  }
}
