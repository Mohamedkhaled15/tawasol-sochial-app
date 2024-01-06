import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/theme/app_colors.dart';

import '../custom_widgets/page_container/page_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      top: false,
      statusBarColor: AppColor.mainAppColor(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.3),
              //     blurRadius: 10.0,
              //     spreadRadius: 2.0,
              //     offset: Offset(0.0, 4.0),
              //   ),
              // ],
              ),
        ),
      ),
    );
  }
}
