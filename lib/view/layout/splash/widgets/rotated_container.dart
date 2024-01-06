import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/theme/app_colors.dart';

class RotatedContainer extends StatelessWidget {
  const RotatedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(AppImages.bgImage), fit: BoxFit.fill),
            color: AppColor.thirdAppColor(),
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
