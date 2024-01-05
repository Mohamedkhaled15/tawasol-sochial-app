import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/theme/app_colors.dart';

class SvgPrefixIcon extends StatelessWidget {
  final String imagePath;
  final Color? color;
  final double? width;
  final double? height;
  const SvgPrefixIcon({
    Key? key,
    required this.imagePath,
    this.color,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      height: 47,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.lightGreyColor(),
      ),
      child: Center(
        child: SvgPicture.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
        ),
      ),
    );
  }
}
