import 'package:flutter/material.dart';
import 'package:wafarly/config/icons/icons_broken.dart';
import 'package:wafarly/core/utils/app_colors.dart';
import 'package:wafarly/core/utils/app_constants.dart';
import 'package:wafarly/core/utils/app_styles.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.content,
    required this.onTap,
  });

  final String title;
  final String content;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppConstants.size10h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleSemiBold16Black,
          ),
          SizedBox(
            height: AppConstants.size5h,
          ),
          Container(
            padding: EdgeInsets.all(AppConstants.size5h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.radius8r),
              color: AppColors.grey50,
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.styleRegular16Black.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.all(AppConstants.size3h),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radius5r),
                      color: AppColors.white,
                    ),
                    child: Icon(
                      IconBroken.Edit,
                      color: AppColors.primary,
                      size: AppConstants.iconSize24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
