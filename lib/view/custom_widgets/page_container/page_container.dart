import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_theme.dart';

enum StatusBarTheme {
  light,
  dark,
}

class PageContainer extends StatelessWidget {
  final Widget child;
  final Color? statusBarColor;
  final Color statusBarForegroundColor;
  final StatusBarTheme? statusBarTheme;
  final bool top;
  final bool bottom;
  final bool right;
  final bool left;

  const PageContainer({
    Key? key,
    required this.child,
    this.statusBarColor,
    this.statusBarForegroundColor = Colors.transparent,
    this.statusBarTheme,
    this.top = true,
    this.bottom = true,
    this.right = true,
    this.left = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.decal,
          colors: [
            const Color(0xff1D2B53),
            Colors.blue,
            Colors.deepPurple,
            const Color(0xff1D2B53),
            Colors.blue,
            Colors.deepPurple,
            const Color(0xff1D2B53),
            Colors.blue,
            Colors.deepPurple,
            const Color(0xff1D2B53),
            Colors.blue,
            Colors.deepPurple,
            const Color(0xff1D2B53),
            Colors.blue,
            AppColor.mainAppColor(),
          ],
          stops: const [
            0.0,
            0.2,
            0.1,
            0.0,
            0.3,
            0.3,
            0.0,
            0.3,
            0.5,
            0.0,
            0.6,
            0.5,
            0.4,
            0.8,
            0.9
          ], // Adjust the stops to control sharpness
        ),
      ),
      // color: statusBarColor ?? AppColor.scaffoldColor(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarForegroundColor,
          statusBarIconBrightness: _android(
            statusBarTheme ??
                AppTheme.getByTheme(
                  light: StatusBarTheme.dark,
                  dark: StatusBarTheme.light,
                ),
          ),
          statusBarBrightness: _ios(
            statusBarTheme ??
                AppTheme.getByTheme(
                  light: StatusBarTheme.dark,
                  dark: StatusBarTheme.light,
                ),
          ),
        ),
        child: SafeArea(
          top: top,
          bottom: bottom,
          right: right,
          left: left,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        ),
      ),
    );
  }

  Brightness _android(StatusBarTheme statusBarTheme) {
    switch (statusBarTheme) {
      case StatusBarTheme.dark:
        return Brightness.dark;
      case StatusBarTheme.light:
        return Brightness.light;
    }
  }

  Brightness _ios(StatusBarTheme statusBarTheme) {
    switch (statusBarTheme) {
      case StatusBarTheme.dark:
        return Brightness.light;
      case StatusBarTheme.light:
        return Brightness.dark;
    }
  }
}
