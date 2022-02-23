import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/constant/theme.dart';
import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'Job Seeker',
      theme: AppTheme.of(context),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
