import 'package:equatable/equatable.dart';

import '../../constant/assets.dart';

class MenuEntity extends Equatable {
  final int index;
  final String name;
  final String icon;

  const MenuEntity({
    required this.index,
    required this.name,
    required this.icon,
  });

  @override
  List<Object> get props => [index, name, icon];

  static const menus = [
    MenuEntity(
      index: 0,
      name: 'Home',
      icon: AppIcons.icMenuHome,
    ),
    MenuEntity(
      index: 1,
      name: 'Bookmark',
      icon: AppIcons.icMenuBookmark,
    ),
    MenuEntity(
      index: 2,
      name: 'Message',
      icon: AppIcons.icMenuMessage,
    ),
    MenuEntity(
      index: 3,
      name: 'Profile',
      icon: AppIcons.icMenuProfile,
    ),
  ];
}
