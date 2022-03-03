import 'package:flutter/material.dart';

import 'colors.dart';

class AppProperties {
  static final shadow = BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 16,
    color: AppColors.black.withOpacity(.05),
  );
}
