import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/intro/intro_page.dart';

import 'core/constant/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Seeker',
      theme: AppTheme.of(context),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
