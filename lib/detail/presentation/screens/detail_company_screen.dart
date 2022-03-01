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

    return const UnderDevelopmentScreen();
  }
}
