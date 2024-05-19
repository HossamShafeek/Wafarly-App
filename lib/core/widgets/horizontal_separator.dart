import 'package:flutter/material.dart';
import 'package:wafarly/core/utils/app_colors.dart';

class CustomHorizontalSeparator extends StatelessWidget {
  const CustomHorizontalSeparator({super.key, this.width = 6, this.color = AppColors.primary,});

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashHeight = 1.0;
        final dashWidth = width;
        final dashCount = (boxWidth / (2 * width)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(
            dashCount,
                (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
