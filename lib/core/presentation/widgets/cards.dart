import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class CustomPrimaryCard extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final BorderRadius? borderRadius;

  const CustomPrimaryCard({
    Key? key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor = AppColors.white,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: [
          AppProperties.shadow,
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
          child: child,
        ),
      ),
    );
  }
}
