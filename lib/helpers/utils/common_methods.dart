import 'package:bot_toast/bot_toast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../view/custom_widgets/custom_toast/custom_toast.dart';
import '../enum/gender_enum.dart';
import '../hive/hive_methods.dart';
import '../locale/app_locale_key.dart';
import '../networking/api_helper.dart';
import '../routes/app_routers.dart';
import '../theme/app_colors.dart';

class CommonMethods {
  static void showAlertDialog({
    String? title,
    required String message,
  }) {
    showCupertinoDialog(
      context: AppRouters.navigatorKey.currentContext!,
      builder: (context) => CupertinoAlertDialog(
        title: title != null
            ? Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: fontFamily(context),
                ),
              )
            : null,
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily(context),
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              tr(AppLocaleKey.ok),
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: fontFamily(context),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      ),
    );
  }

  static void showChooseDialog(
    BuildContext context, {
    String? title,
    required String message,
    required VoidCallback onPressed,
  }) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title != null
            ? Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: fontFamily(context),
                ),
              )
            : null,
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: fontFamily(context),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(
              tr(AppLocaleKey.no),
              style: TextStyle(
                color: AppColor.darkTextColor(),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: CommonMethods.fontFamily(context),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(
              tr(AppLocaleKey.yes),
              style: TextStyle(
                color: AppColor.darkTextColor(),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: CommonMethods.fontFamily(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showToast({
    required String message,
    String? title,
    String? icon,
    ToastType type = ToastType.success,
    Color? backgroundColor,
    Color? textColor,
    int seconds = 3,
  }) {
    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      toastBuilder: (cancelFunc) => CustomToast(
        type: type,
        title: title,
        message: message,
        backgroundColor: backgroundColor,
        icon: icon,
        textColor: textColor,
      ),
    );
  }

  static void showError({
    ApiResponse? apiResponse,
    required String message,
    String? title,
    String? icon,
    Color? backgroundColor,
    Color? textColor,
    int seconds = 3,
  }) {
    BotToast.showCustomText(
      duration: Duration(seconds: seconds),
      toastBuilder: (context) => CustomToast(
        title: title,
        message: message,
        type: apiResponse?.state == ResponseState.offline
            ? ToastType.offline
            : ToastType.error,
        backgroundColor: backgroundColor,
        icon: icon,
        textColor: textColor,
      ),
    );
  }

  static String translateApi({
    required String ar,
    required String en,
    required BuildContext context,
  }) {
    String text = '';
    switch (context.locale.languageCode) {
      case 'ar':
        text = ar;
        break;
      case 'en':
        text = en;
        break;
    }
    return text;
  }

  static dynamic getWhenLang({
    required dynamic ar,
    required dynamic en,
    required BuildContext context,
  }) {
    switch (context.locale.languageCode) {
      case 'ar':
        return ar;
      case 'en':
        return en;
    }
  }

  static String replaceToArabicNumber(String input) {
    return input
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩');
  }

  static String replaceToEnglishNumber(String input) {
    return input
        .replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9');
  }

  static void doWhenLang({
    required VoidCallback ar,
    required VoidCallback en,
    required BuildContext context,
  }) {
    switch (context.locale.languageCode) {
      case 'ar':
        ar.call();
        break;
      case 'en':
        en.call();
        break;
    }
  }

  static void doWhenLogin({
    required VoidCallback function,
  }) {
    if (HiveMethods.getToken() != null) {
      function.call();
    } else {
      showAlertDialog(
        message: tr(AppLocaleKey.pleaseLoginFirst),
      );
    }
  }

  static bool isRTL(BuildContext context) {
    return intl.Bidi.isRtlLanguage(context.locale.languageCode);
  }

  static String removeHtmlTags(String text) {
    return intl.Bidi.stripHtmlIfNeeded(text);
  }

  static String fontFamily(BuildContext context) {
    return 'ElMessiri';
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static GenderEnum setGenderValue(String gender) {
    if (gender == 'male') {
      return GenderEnum.male;
    } else {
      return GenderEnum.female;
    }
  }

  static Future<bool> hasConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static List<DropdownMenuItem<dynamic>> dropdownMenuItems = [
    {'id': 1, 'value': 'First Item'},
    {'id': 2, 'value': 'Second Item'},
    {'id': 3, 'value': 'Third Item'},
    {'id': 4, 'value': 'Fourth Item'},
    {'id': 5, 'value': 'Fifth Item'},
    {'id': 6, 'value': 'Sixth Item'},
    {'id': 7, 'value': 'Seventh Item'},
    {'id': 8, 'value': 'Eighth Item'},
    {'id': 9, 'value': 'Ninth Item'},
    {'id': 10, 'value': 'Tenth Item'},
  ]
      .map(
        (e) => DropdownMenuItem(
          value: int.tryParse(e['id'].toString()),
          child: Text(e['value']?.toString() ?? ""),
        ),
      )
      .toList();

  static void changeLanguage(
    BuildContext context, {
    required VoidCallback onAr,
    required VoidCallback onEn,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          tr(AppLocaleKey.language),
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily(context),
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              onAr.call();
              HiveMethods.updateLang(const Locale('ar'));
              Navigator.pop(context);
            },
            child: Text(
              'العربية',
              style: TextStyle(
                fontFamily: fontFamily(context),
                color: context.locale == const Locale('ar')
                    ? AppColor.mainAppColor()
                    : AppColor.darkTextColor(),
              ),
            ),
          ),
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              onEn.call();
              HiveMethods.updateLang(const Locale('en'));
              Navigator.pop(context);
            },
            child: Text(
              'English',
              style: TextStyle(
                fontFamily: fontFamily(context),
                color: context.locale == const Locale('en')
                    ? AppColor.mainAppColor()
                    : AppColor.darkTextColor(),
              ),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            tr(AppLocaleKey.cancel),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontFamily: fontFamily(context),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
