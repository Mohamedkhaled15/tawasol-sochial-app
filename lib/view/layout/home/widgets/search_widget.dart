import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tawasol/helpers/images/app_images.dart';
import 'package:tawasol/helpers/locale/app_locale_key.dart';
import 'package:tawasol/helpers/theme/app_colors.dart';
import 'package:tawasol/view/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:tawasol/view/layout/search/search_screen.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.enableTyping,
    required this.enableNavigate,
    this.borderColor,
    this.focusNode,
    this.onTap,
  });
  final bool enableTyping;
  final bool enableNavigate;
  final Color? borderColor;
  final FocusNode? focusNode;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.textFormColor().withOpacity(0.1),
              child: SvgPicture.asset(AppImages.sendIcon),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomFormField(
              focusNode: focusNode,
              onTap: enableNavigate
                  ? () {
                      Navigator.pushNamed(context, SearchScreen.routeName);
                    }
                  : () {},
              readOnly: enableTyping,
              radius: 25,
              focusColor: borderColor,
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
