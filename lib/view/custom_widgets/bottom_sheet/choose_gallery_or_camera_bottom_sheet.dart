import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/images/app_images.dart';
import '../../../helpers/locale/app_locale_key.dart';
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_text_style.dart';

class ChooseGalleryOrCameraBottomSheet extends StatelessWidget {
  final void Function()? onCamera;
  final void Function()? onGallery;
  const ChooseGalleryOrCameraBottomSheet({
    Key? key,
    this.onCamera,
    this.onGallery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.bottomSheetColor(),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          SizedBox(
            width: 40,
            child: Divider(color: AppColor.hintColor()),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextButton(
                    onPressed: onCamera,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.cameraIcon,
                          colorFilter: ColorFilter.mode(
                            AppColor.mainAppColor(),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          tr(AppLocaleKey.camera),
                          style: AppTextStyle.textL15R(),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColor.hintColor(),
                  ),
                  TextButton(
                    onPressed: onGallery,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.galleryIcon,
                          colorFilter: ColorFilter.mode(
                            AppColor.mainAppColor(),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          tr(AppLocaleKey.gallery),
                          style: AppTextStyle.textL15R(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
