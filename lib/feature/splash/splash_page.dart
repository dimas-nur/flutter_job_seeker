import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../lib.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _navigate() async {
    final _prefs = await SharedPreferences.getInstance();

    final _isFirstLoad = _prefs.getBool(AppKeys.prefsIntro) ?? true;

    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) =>
                _isFirstLoad ? const IntroPage() : const HomePage()),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.primary,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                AppIcons.appIcon,
                width: 102,
              ),
            ),
            Positioned.fill(
              bottom: 48,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  AppIcons.icDicoding,
                  width: 128,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
