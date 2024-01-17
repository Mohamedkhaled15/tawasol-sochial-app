import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppColor {
  static LinearGradient gradientColor() {
    return AppTheme.getByTheme(
      light: const LinearGradient(
        colors: [Color(0xff5151C6), Color(0xff888BF4)],
      ),
      dark: const LinearGradient(
        colors: [Color(0xff5151C6), Color(0xff888BF4)],
      ),
    );
  }

  static Color mainAppColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff2F80ED),
      dark: const Color(0xff2F80ED),
    );
  }

  static Color purpleColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff4A369D),
      dark: const Color(0xff4A369D),
    );
  }

  static Color secondAppColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffFA6650),
      dark: const Color(0xffFA6650),
    );
  }

  static Color thirdAppColor() {
    return AppTheme.getByTheme(
      light: const Color.fromARGB(255, 35, 8, 81),
      dark: const Color.fromARGB(255, 35, 8, 81),
    );
  }

  static Color borderColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffE8ECF4),
      dark: const Color(0xffE8ECF4),
    );
  }

  static Color scaffoldColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffffffff),
      dark: const Color(0xff000000),
    );
  }

  static Color hintColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff8391A1),
      dark: const Color(0xff8391A1),
    );
  }

  static Color darkTextColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff000000),
      dark: const Color(0xff000000),
    );
  }

  static Color lightTextColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff787878),
      dark: const Color(0xff787878),
    );
  }

  static Color lightButtonColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffE3E4FC),
      dark: const Color(0xffE3E4FC),
    );
  }

  static Color pinkColor() {
    return AppTheme.getByTheme(
      light: const Color(0xFFCE4C4C),
      dark: const Color(0xFFCE4C4C),
    );
  }

  static Color greyColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffBCBCBC),
      dark: const Color(0xffBCBCBC),
    );
  }

  static Color darkGreyColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff828282),
      dark: const Color(0xff828282),
    );
  }

  static Color lightGreyColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff7D7D7D),
      dark: const Color(0xff7D7D7D),
    );
  }

  static Color redColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffE80000),
      dark: const Color(0xffE80000),
    );
  }

  static Color greenColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff64AF30),
      dark: const Color(0xff64AF30),
    );
  }

  static Color blackColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff242424),
      dark: const Color(0xff242424),
    );
  }

  static Color darkBlackColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff000000),
      dark: const Color(0xff000000),
    );
  }

  static Color whiteColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffffffff),
      dark: const Color(0xffffffff),
    );
  }

  static Color offWhiteColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffFAFAFA),
      dark: const Color(0xffFAFAFA),
    );
  }

  static Color yellowColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffFFCC00),
      dark: const Color(0xffFFCC00),
    );
  }

  static Color blueColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff007FB1),
      dark: const Color(0xff007FB1),
    );
  }

  static Color textFormColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff7D7D7D),
      dark: const Color(0xff7D7D7D),
    );
  }

  static Color bottomSheetColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffffffff),
      dark: const Color(0xffffffff),
    );
  }

  static Color appBarTextColor() {
    return AppTheme.getByTheme(
      light: const Color(0xff000000),
      dark: const Color(0xff000000),
    );
  }

  static Color buttonTextColor() {
    return AppTheme.getByTheme(
      light: const Color(0xffffffff),
      dark: const Color(0xffffffff),
    );
  }

  static Color inActiveColor() {
    return AppTheme.getByTheme(
      light: const Color(0xFFBDBDBD),
      dark: const Color(0xFFBDBDBD),
    );
  }
}
