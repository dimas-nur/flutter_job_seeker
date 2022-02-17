import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData of(BuildContext context) {
    final theme = Theme.of(context);

    return theme.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      backgroundColor: AppColors.white,
      textTheme: GoogleFonts.dmSansTextTheme().apply(
        bodyColor: AppColors.primaryDark,
        displayColor: AppColors.primaryDark,
      ),
    );
  }
}
