import 'package:flutter/material.dart';

class CustomVerticalSeparator extends StatelessWidget {
  const CustomVerticalSeparator({super.key, this.height = 6, this.color = Colors.black,});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxHeight = constraints.constrainHeight();
        const dashWidth = 1.0;
        final dashHeight = height;
        final dashCount = (boxHeight / (2 * height)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
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
