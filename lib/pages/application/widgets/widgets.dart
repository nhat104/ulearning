import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_learning/common/values/colors.dart';
import 'package:u_learning/pages/home/home_page.dart';
import 'package:u_learning/pages/profile/profile_page.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Course Page')),
    const Center(child: Text('Chat Page')),
    const ProfilePage(),
  ];

  return widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/home.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child:
          Image.asset('assets/icons/home.png', color: AppColors.primaryElement),
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/search2.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/search2.png',
          color: AppColors.primaryElement),
    ),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/play-circle1.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/play-circle1.png',
          color: AppColors.primaryElement),
    ),
    label: 'Course',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/message-circle.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/message-circle.png',
          color: AppColors.primaryElement),
    ),
    label: 'Chat',
  ),
  BottomNavigationBarItem(
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/person2.png'),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset('assets/icons/person2.png',
          color: AppColors.primaryElement),
    ),
    label: 'Profile',
  ),
];
