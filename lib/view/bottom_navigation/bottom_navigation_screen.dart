import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:templet/helpers/images/app_images.dart';

import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/utils/navigator_methods.dart';
import 'package:templet/view/layout/add_post/screen/add_post_screen.dart';
import 'package:templet/view/layout/category/screen/category_screen.dart';
import 'package:templet/view/layout/home/screen/home_screen.dart';
import 'package:templet/view/layout/notification/screen/notification_screen.dart';
import 'package:templet/view/layout/profile/screen/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  static const String routeName = 'BottomNavigationScreen';
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        // backgroundColor: AppColor.mainAppColor(),
        onPressed: () {
          NavigatorMethods.pushNamed(context, AddPostScreen.routeName);
        },
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle, gradient: AppColor.gradientColor()),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset(AppImages.plusIcon),
            )),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        shadowColor: AppColor.mainAppColor(),
        padding: const EdgeInsets.all(20),
        height: 70,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 0;
                    _pageController.jumpToPage(0);
                  });
                },
                child: _currentIndex == 0
                    ? SvgPicture.asset(AppImages.homeFillIcon)
                    : SvgPicture.asset(AppImages.homeIcon)),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 1;
                    _pageController.jumpToPage(1);
                  });
                },
                child: _currentIndex == 1
                    ? SvgPicture.asset(AppImages.profileFillIcon)
                    : SvgPicture.asset(AppImages.profileIcon)),
            const SizedBox(),
            const SizedBox(),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 2;
                    _pageController.jumpToPage(2);
                  });
                },
                child: _currentIndex == 2
                    ? SvgPicture.asset(AppImages.categoryFilIcon)
                    : SvgPicture.asset(AppImages.categoryIcon)),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = 3;
                    _pageController.jumpToPage(3);
                  });
                },
                child: _currentIndex == 3
                    ? SvgPicture.asset(AppImages.notificationFillIcon)
                    : SvgPicture.asset(AppImages.notificationIcon)),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        children: [
          HomeScreen(),
          ProfileScreen(),
          CategoryScreen(),
          NotificationScreen(),
        ],
      ),
    );
  }
}
