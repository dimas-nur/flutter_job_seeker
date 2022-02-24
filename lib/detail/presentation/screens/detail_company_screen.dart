import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/core/core.dart';
import 'package:flutter_job_seeker/core/data/data.dart';

class DetailCompanyScreen extends StatefulWidget {
  final JobEntity job;

  const DetailCompanyScreen({
    Key? key,
    required this.job,
  }) : super(key: key);

  @override
  _DetailCompanyScreenState createState() => _DetailCompanyScreenState();
}

class _DetailCompanyScreenState extends State<DetailCompanyScreen> {
  late ThemeData _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.imgDevelopment,
            width: 124,
            height: 124,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Opps!',
            style: _theme.textTheme.headline5?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Under Construction',
            style: _theme.textTheme.bodyText1?.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
