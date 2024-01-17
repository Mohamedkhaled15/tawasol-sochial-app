import 'package:flutter/material.dart';
import 'package:templet/helpers/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.blackColor(),
    );
  }
}
