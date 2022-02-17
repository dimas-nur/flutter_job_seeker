import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/core.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 600 || constraints.maxHeight > 1080
              ? _bodyWeb()
              : _bodyMobile();
        },
      ),
    );
  }

  Widget _bodyMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: _illustration(),
        ),
        const Spacer(),
        Expanded(
          flex: 6,
          child: _introText(),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: CustomPrimaryButton(
            onPressed: () {},
            text: 'Get Started',
          ),
        ),
      ],
    );
  }

  Widget _bodyWeb() {
    return Container(
      color: AppColors.primary,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(32),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blueSoft.withOpacity(0.2),
                  offset: const Offset(0, 16),
                  blurRadius: 40,
                )
              ]),
          constraints: const BoxConstraints(
            maxWidth: 600,
            maxHeight: 1080,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: _bodyMobile(),
          ),
        ),
      ),
    );
  }

  Widget _illustration() {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            top: -100,
            child: SvgPicture.asset(
              AppIllustrations.illIntro,
              fit: BoxFit.fitHeight,
              alignment: const Alignment(-0.4, 0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _introText() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              AppStrings.introTitle,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Flexible(
            child: Text(
              AppStrings.introDescription,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}
