import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:image_stack/image_stack.dart';
import 'package:tawasol/helpers/images/app_images.dart';
import 'package:tawasol/helpers/theme/app_colors.dart';
import 'package:tawasol/helpers/theme/app_text_style.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'ProfileScreen';
  ProfileScreen({super.key});
  final List<String> images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
    'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            AppImages.profileBGIcon,
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      backgroundColor: AppColor.whiteColor(),
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColor.whiteColor(),
                        backgroundImage: const AssetImage(AppImages.man),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'userEmail@',
                          style: AppTextStyle.textW24B(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: AppColor.whiteColor()),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 40,
                  child: SvgPicture.asset(
                    AppImages.settingsIcon,
                    colorFilter: ColorFilter.mode(
                        AppColor.whiteColor(), BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
          Text('userName', style: AppTextStyle.textD18B()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.mainAppColor().withAlpha(50),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Following', style: AppTextStyle.textD18B()),
                  Text('120', style: AppTextStyle.textL16B()),
                  const SizedBox(
                    height: 50,
                  ),
                  Text('Followers', style: AppTextStyle.textD18B()),
                  Text('120', style: AppTextStyle.textL16B()),
                ],
              ),
            ),
          ),
          ImageStack(
            imageList: images,
            totalCount: images
                .length, // If larger than images.length, will show extra empty circle
            imageRadius: 100, // Radius of each images
            imageCount: 3, // Maximum number of images to be shown in stack
            imageBorderWidth: 3, // Border width around the images
          ),
        ]),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  } // @override

  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  } // @override
}
