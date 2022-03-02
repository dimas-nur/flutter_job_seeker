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

  bool _isDrawerExpanded = false;

  void _navigateMenu(int index) {
    if (index != _navigationIndex) {
      setState(() {
        _navigationIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          if (_screen.width > 600) _drawer(),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                HomePage(),
                UnderDevelopmentScreen(),
                UnderDevelopmentScreen(),
                UnderDevelopmentScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _screen.width > 600
          ? null
          : BottomNavigationBar(
              currentIndex: _navigationIndex,
              onTap: (index) => _navigateMenu(index),
              selectedFontSize: 0,
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: MenuEntity.menus.map((menu) {
                return BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    menu.icon,
                  ),
                  activeIcon: SizedBox(
                    height: kBottomNavigationBarHeight,
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            menu.icon,
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
                  label: menu.name,
                );
              }).toList(),
            ),
    );
  }

  Widget _drawer() {
    return SafeArea(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        width: _isDrawerExpanded ? 150 : 58,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Tooltip(
              message: 'Menu',
              child: ListTile(
                onTap: () {
                  setState(() {
                    _isDrawerExpanded = !_isDrawerExpanded;
                  });
                },
                title: _isDrawerExpanded
                    ? const Icon(
                        Icons.close_rounded,
                        size: 28,
                        color: AppColors.grey,
                      )
                    : SvgPicture.asset(
                        AppIcons.icCategory,
                        width: 24,
                        height: 24,
                        color: AppColors.grey,
                      ),
              ),
            ),
            const Divider(
              indent: 8,
              endIndent: 8,
            ),
            ...MenuEntity.menus.map((menu) {
              return Stack(
                children: [
                  ListTile(
                    onTap: () => _navigateMenu(menu.index),
                    leading: SvgPicture.asset(
                      menu.icon,
                      width: 24,
                      height: 24,
                      color: _navigationIndex == menu.index
                          ? AppColors.primary
                          : null,
                    ),
                    title: _isDrawerExpanded
                        ? Text(
                            menu.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: _navigationIndex == menu.index
                                  ? AppColors.primary
                                  : null,
                            ),
                          )
                        : null,
                    horizontalTitleGap: 0.0,
                  ),
                  if (_navigationIndex == menu.index)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 24,
                          width: 3,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
