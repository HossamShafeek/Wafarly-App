import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_strings.dart';

class CustomSlidable extends StatelessWidget {
  const CustomSlidable(
      {super.key,
      required this.child,
      required this.edit,
      required this.delete});

  final Widget child;
  final void Function(BuildContext context) edit;
  final void Function(BuildContext context) delete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(AppConstants.radius8r),
            onPressed: edit,
            backgroundColor: AppColors.blue,
            foregroundColor: Colors.white,
            icon: IconBroken.Edit,
            label: AppStrings.update,
          ),
          SlidableAction(
            borderRadius: BorderRadius.circular(AppConstants.radius8r),
            onPressed: delete,
            backgroundColor: AppColors.redAccent,
            foregroundColor: Colors.white,
            icon: IconBroken.Delete,
            label: AppStrings.delete,
          ),
        ],
      ),
      child: child,
    );
  }
}
