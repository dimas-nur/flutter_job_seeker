import 'package:flutter/material.dart';

import '../../core.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: AppColors.white,
              fontSize: 16,
            ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final double width;
  final double height;
  final Color backgroundColor;
  final BorderRadius? borderRadius;

  const CustomIconButton({
    Key? key,
    required this.onTap,
    required this.icon,
    this.width = 32,
    this.height = 32,
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
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
