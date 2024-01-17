import 'package:flutter/material.dart';
import 'package:templet/helpers/theme/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = 'CategoryScreen';
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.mainAppColor(),
    );
  }
}
