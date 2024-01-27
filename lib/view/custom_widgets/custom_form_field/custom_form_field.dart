import 'dart:ui' as ui;

import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_text_style.dart';
import '../../../helpers/utils/common_methods.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? hintText;
  final int? maxLines;
  final void Function()? onTap;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double radius;
  final Color? fillColor;
  final Color? focusColor;
  final Color? unFocusColor;
  final Color? passwordColor;
  final String? title;
  final String? otherSideTitle;
  final ui.TextDirection? textDirection;
  final Country? country;
  final InputBorder? border;
  final FocusNode? focusNode;

  const CustomFormField({
    Key? key,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.isPassword = false,
    this.hintText,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.radius = 10,
    this.fillColor,
    this.focusColor,
    this.unFocusColor,
    this.title,
    this.textDirection,
    this.otherSideTitle,
    this.country,
    this.passwordColor,
    this.border,
    this.focusNode,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (widget.title != null) ...{
                Expanded(
                  child: Text(
                    widget.title!,
                    style: AppTextStyle.formTitleStyle(),
                  ),
                ),
              },
              if (widget.otherSideTitle != null) ...{
                Text(
                  widget.otherSideTitle!,
                  style: AppTextStyle.formTitleStyle(),
                ),
              }
            ],
          ),
          if (widget.title != null || widget.otherSideTitle != null) ...{
            const SizedBox(height: 7),
          },
          Directionality(
            textDirection: widget.textDirection != null
                ? widget.textDirection!
                : CommonMethods.isRTL(context)
                    ? ui.TextDirection.rtl
                    : ui.TextDirection.ltr,
            child: TextFormField(
              focusNode: widget.focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              validator: widget.validator,
              onTap: widget.onTap,
              readOnly: widget.readOnly,
              keyboardType: widget.keyboardType,
              obscureText: widget.isPassword ? _obscureText : false,
              style: AppTextStyle.textFormStyle(),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: widget.maxLines,
              cursorColor: widget.focusColor ?? AppColor.mainAppColor(),
              decoration: InputDecoration(
                hintMaxLines: 2,
                hintText: widget.hintText,
                hintStyle: AppTextStyle.hintStyle(),
                fillColor: widget.fillColor ?? AppColor.offWhiteColor(),
                filled: true,
                border: widget.border ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.radius),
                      borderSide: BorderSide(
                        color: widget.unFocusColor ?? AppColor.borderColor(),
                      ),
                    ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.unFocusColor ?? AppColor.borderColor(),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.focusColor ?? AppColor.mainAppColor(),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                  borderSide: BorderSide(
                    color: widget.unFocusColor ?? AppColor.borderColor(),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                prefixIcon: widget.country != null &&
                        context.locale == const Locale('en')
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          widget.prefixIcon ?? const SizedBox(),
                          TextButton(
                            onPressed: null,
                            child: Text(
                              '+${widget.country?.phoneCode}',
                              style: AppTextStyle.textM14M(),
                              textDirection: ui.TextDirection.ltr,
                            ),
                          ),
                        ],
                      )
                    : widget.prefixIcon,
                suffixIcon: widget.country != null &&
                        context.locale == const Locale('ar')
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text(
                              '+${widget.country?.phoneCode}',
                              style: AppTextStyle.textM14M(),
                              textDirection: ui.TextDirection.ltr,
                            ),
                          ),
                          widget.suffixIcon ?? const SizedBox(),
                        ],
                      )
                    : widget.isPassword
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 20,
                            ),
                          )
                        : widget.suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
