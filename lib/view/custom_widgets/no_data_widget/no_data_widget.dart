import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helpers/images/app_images.dart';
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_theme.dart';
import '../../../helpers/utils/common_methods.dart';

class NoDataWidget extends StatelessWidget {
  final Axis axis;
  final String? message;
  const NoDataWidget({
    Key? key,
    this.axis = Axis.vertical,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (axis) {
      case Axis.horizontal:
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.mainAppColor().withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppImages.emptyFolderIcon,
                colorFilter: ColorFilter.mode(
                  AppTheme.getByTheme(
                    light: Colors.white70,
                    dark: Colors.black87,
                  ),
                  BlendMode.srcIn,
                ),
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message ??
                    CommonMethods.translateApi(
                      ar: "لا توجد بيانات",
                      en: "There is no data",
                      context: context,
                    ),
                style: TextStyle(
                  color: AppTheme.getByTheme(
                    light: Colors.black87,
                    dark: Colors.white70,
                  ),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        );

      case Axis.vertical:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.mainAppColor().withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppImages.emptyFolderIcon,
                colorFilter: ColorFilter.mode(
                  AppTheme.getByTheme(
                    light: Colors.white70,
                    dark: Colors.black87,
                  ),
                  BlendMode.srcIn,
                ),
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message ??
                  CommonMethods.translateApi(
                    ar: "لا توجد بيانات",
                    en: "There is no data",
                    context: context,
                  ),
              style: TextStyle(
                color: AppTheme.getByTheme(
                  light: Colors.black87,
                  dark: Colors.white70,
                ),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
    }
  }
}
