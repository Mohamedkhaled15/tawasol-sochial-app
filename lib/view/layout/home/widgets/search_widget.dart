import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/view/custom_widgets/custom_form_field/custom_form_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColor.textFormColor().withOpacity(0.1),
            child: SvgPicture.asset(AppImages.sendIcon),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomFormField(
              radius: 25,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppImages.searchIcon,
                  colorFilter: ColorFilter.mode(
                    AppColor.thirdAppColor(),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              hintText: tr(AppLocaleKey.search),
            ),
          ),
        ],
      ),
    );
  }
}
