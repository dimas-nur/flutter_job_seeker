import 'package:flutter/material.dart';

import '../core.dart';

extension SnackbarUtils on BuildContext {
  void showUnderDevelopment() {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: AppColors.primary,
          content: Text(
            AppStrings.dialogUnderDevelopment,
            style: TextStyle(
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
  }
}
