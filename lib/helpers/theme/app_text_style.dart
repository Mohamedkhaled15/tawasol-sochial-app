import 'package:flutter/material.dart';

import '../utils/common_methods.dart';
import 'app_colors.dart';

class AppTextStyle {
  static TextStyle appBarStyle(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColor.appBarTextColor(),
      fontFamily: CommonMethods.fontFamily(context),
    );
  }

  static TextStyle buttonStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColor.buttonTextColor(),
    );
  }

  static TextStyle hintStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColor.hintColor(),
    );
  }

  static TextStyle textFormStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColor.textFormColor(),
    );
  }

  static TextStyle formTitleStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textD15R() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textL15R() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.lightTextColor(),
    );
  }

  static TextStyle textM15R() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.mainAppColor(),
    );
  }

  static TextStyle textS15R() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColor.secondAppColor(),
    );
  }

  static TextStyle textD14M() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textL14M() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.lightTextColor(),
    );
  }

  static TextStyle textM14M() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.mainAppColor(),
    );
  }

  static TextStyle textS14M() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColor.secondAppColor(),
    );
  }

  static TextStyle textD16B() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textD18B() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textL16B() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.lightTextColor(),
    );
  }

  static TextStyle textM16B() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.mainAppColor(),
    );
  }

  static TextStyle textM18B() {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: AppColor.mainAppColor(),
    );
  }

  static TextStyle textS16B() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.secondAppColor(),
    );
  }

  static TextStyle textD10B() {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textL10B() {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.lightTextColor(),
    );
  }

  static TextStyle textM10B() {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.mainAppColor(),
    );
  }

  static TextStyle textS10B() {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      color: AppColor.secondAppColor(),
    );
  }

  static TextStyle textD12B() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.darkTextColor(),
    );
  }

  static TextStyle textL12B() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.lightTextColor(),
    );
  }

  static TextStyle textM12B() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.mainAppColor(),
    );
  }

  static TextStyle textS12B() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColor.secondAppColor(),
    );
  }

  static TextStyle textW24B() {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColor.whiteColor(),
    );
  }

  static TextStyle textW40B() {
    return TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: AppColor.whiteColor(),
    );
  }

  static TextStyle textW50B() {
    return TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      color: AppColor.whiteColor(),
    );
  }

  static TextStyle textM20B() {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.mainAppColor(),
    );
  }
}
