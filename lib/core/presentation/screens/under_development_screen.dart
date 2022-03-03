import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  final Color color;

  const UnderDevelopmentScreen({
    Key? key,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SvgPicture.asset(
              AppIllustrations.illDevelopment,
              width: 124,
              height: 124,
              color: color,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            child: Text(
              AppStrings.underDevelopmentTitle,
              style: _theme.textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: Text(
              AppStrings.underDevelopmentDescription,
              style: _theme.textTheme.bodyText1?.copyWith(
                fontSize: 18,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
