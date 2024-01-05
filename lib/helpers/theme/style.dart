import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';
import 'app_theme.dart';

import '../utils/common_methods.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
    primaryColor: AppColor.mainAppColor(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: false,
    hintColor: AppColor.hintColor(),
    brightness: AppTheme.getByTheme(
      light: Brightness.light,
      dark: Brightness.dark,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColor.mainAppColor(),
      alignedDropdown: true,
    ),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColor.mainAppColor(),
      secondary: AppColor.secondAppColor(),
      background: AppColor.whiteColor(),
      brightness: AppTheme.getByTheme(
        light: Brightness.light,
        dark: Brightness.dark,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColor.secondAppColor(),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.appBarStyle(context),
    ),
    scaffoldBackgroundColor: AppColor.scaffoldColor(),
    fontFamily: CommonMethods.fontFamily(context),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.mainAppColor(),
    ),
    platform: TargetPlatform.iOS,
  );
}
