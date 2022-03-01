import 'package:flutter/material.dart';

import '../../core.dart';

class CustomImageNetwork extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  const CustomImageNetwork(
    this.url, {
    Key? key,
    this.width = 48,
    this.height = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return SizedBox(
          width: width,
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.blueSoft.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(height < 40 ? 8 : 16),
            child: Center(
              child:
                  CircularProgressIndicator(strokeWidth: height < 40 ? 2 : 4),
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppImages.imgPlaceholder,
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
