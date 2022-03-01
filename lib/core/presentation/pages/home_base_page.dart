import 'package:flutter/material.dart';
import 'package:flutter_job_seeker/core/core.dart';
import 'package:flutter_job_seeker/home/presentation/page/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBasePage extends StatefulWidget {
  const HomeBasePage({Key? key}) : super(key: key);

  @override
  _HomeBasePageState createState() => _HomeBasePageState();
}

class _HomeBasePageState extends State<HomeBasePage>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _navigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _navigationIndex = index;
          });
        },
        children: const [
          HomePage(),
          UnderDevelopmentScreen(),
          UnderDevelopmentScreen(),
          UnderDevelopmentScreen(),
        ],
      ),
      bottomNavigationBar: _screen.width > 600
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BottomNavigationBar(
                  currentIndex: _navigationIndex,
                  onTap: (index) {
                    setState(() {
                      _navigationIndex = index;
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    });
                  },
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.icMenuHome,
                      ),
                      activeIcon: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                AppIcons.icMenuHome,
                                color: AppColors.primary,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 3,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.icMenuBookmark,
                      ),
                      activeIcon: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                AppIcons.icMenuBookmark,
                                color: AppColors.primary,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 3,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: 'Bookmark',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.icMenuMessage,
                      ),
                      activeIcon: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                AppIcons.icMenuMessage,
                                color: AppColors.primary,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 3,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: 'Message',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppIcons.icMenuProfile,
                      ),
                      activeIcon: SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Stack(
                          children: [
                            Center(
                              child: SvgPicture.asset(
                                AppIcons.icMenuProfile,
                                color: AppColors.primary,
                              ),
                            ),
                            Positioned(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 3,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: 'Profile',
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
