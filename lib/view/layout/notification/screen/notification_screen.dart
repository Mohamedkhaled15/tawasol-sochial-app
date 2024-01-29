import 'package:flutter/material.dart';
import 'package:tawasol/helpers/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = 'NotificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.blueColor(),
    );
  }
}
