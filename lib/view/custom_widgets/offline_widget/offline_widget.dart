import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/images/app_images.dart';
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_text_style.dart';
import '../../../helpers/theme/app_theme.dart';
import '../../../helpers/utils/common_methods.dart';
import '../buttons/custom_button.dart';

class OfflineWidget extends StatelessWidget {
  final Axis axis;
  final void Function()? onReload;
  const OfflineWidget({
    Key? key,
    this.axis = Axis.vertical,
    this.onReload,
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
                AppImages.offlineIcon,
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
                CommonMethods.translateApi(
                  ar: "تأكد من الاتصال بالإنترنت",
                  en: "Make sure you are connected to the internet",
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
            const SizedBox(width: 10),
            IconButton(
              onPressed: onReload,
              icon: CircleAvatar(
                backgroundColor: AppColor.mainAppColor().withOpacity(0.6),
                child: Icon(
                  Icons.wifi_protected_setup_rounded,
                  color: AppTheme.getByTheme(
                    light: Colors.white70,
                    dark: Colors.black87,
                  ),
                ),
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
                AppImages.offlineIcon,
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
              CommonMethods.translateApi(
                ar: "تأكد من الاتصال بالإنترنت",
                en: "Make sure you are connected to the internet",
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
            const SizedBox(height: 10),
            CustomButton(
              text: CommonMethods.translateApi(
                ar: "إعادة تحميل",
                en: "Reload",
                context: context,
              ),
              style: AppTextStyle.buttonStyle().copyWith(
                color: AppTheme.getByTheme(
                  light: Colors.white70,
                  dark: Colors.black87,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.5,
              prefixIcon: Icon(
                Icons.wifi_protected_setup_rounded,
                color: AppTheme.getByTheme(
                  light: Colors.white70,
                  dark: Colors.black87,
                ),
              ),
              height: 40,
              onPressed: onReload,
            ),
          ],
        );
    }
  }
}
