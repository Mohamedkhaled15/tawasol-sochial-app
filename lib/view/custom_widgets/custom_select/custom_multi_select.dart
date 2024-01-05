import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/networking/api_helper.dart';
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_text_style.dart';
import '../../../helpers/utils/common_methods.dart';
import '../../../helpers/utils/navigator_methods.dart';
import '../api_response_widget/api_response_widget.dart';
import '../buttons/custom_button.dart';
import 'custom_select_item.dart';

class CustomMultiSelect extends StatefulWidget {
  final List<dynamic> value;
  final List<CustomSelectItem>? items;
  final void Function(List<dynamic>)? onChanged;
  final String? Function(List<dynamic>)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double radius;
  final Color? fillColor;
  final Color? focusColor;
  final Color? unFocusColor;
  final String? title;
  final String? otherSideTitle;
  final ApiResponse? apiResponse;
  final void Function()? onReload;
  final Widget? icon;
  const CustomMultiSelect({
    super.key,
    this.value = const [],
    this.items,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.radius = 25,
    this.fillColor,
    this.focusColor,
    this.unFocusColor,
    this.title,
    this.otherSideTitle,
    this.apiResponse,
    this.onReload,
    this.icon,
  });

  @override
  State<CustomMultiSelect> createState() => _CustomMultiSelectState();
}

class _CustomMultiSelectState extends State<CustomMultiSelect> {
  final _selectedEC = TextEditingController();

  void _showValue() {
    Future.delayed(Duration.zero, () {
      _selectedEC.text = widget.items
              ?.where((element) => List.generate(
                    widget.value.length,
                    (index) => widget.value[index],
                  ).contains(element.value))
              .map((e) => e.name)
              .join(' , ') ??
          "";
    });
  }

  @override
  Widget build(BuildContext context) {
    _showValue();
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
          TextFormField(
            controller: _selectedEC,
            validator: (v) => widget.validator?.call(widget.value),
            onTap: widget.apiResponse?.state == ResponseState.loading
                ? null
                : widget.items != null && widget.items?.isNotEmpty == true
                    ? () {
                        NavigatorMethods.showAppBottomSheet(
                          context,
                          CustomMultiSelectBottomSheet(
                            value: widget.value,
                            items: widget.items,
                            onChanged: (v) {
                              widget.onChanged?.call(v);
                            },
                          ),
                          isScrollControlled: true,
                        );
                      }
                    : () {
                        CommonMethods.showAlertDialog(
                          message: CommonMethods.translateApi(
                            ar: "لا توجد بيانات",
                            en: "There is no data",
                            context: context,
                          ),
                        );
                      },
            readOnly: true,
            keyboardType: widget.keyboardType,
            style: AppTextStyle.textFormStyle(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: widget.maxLines,
            cursorColor: widget.focusColor,
            decoration: InputDecoration(
              hintMaxLines: 2,
              hintText: widget.hintText,
              hintStyle: AppTextStyle.hintStyle(),
              fillColor: widget.fillColor ?? AppColor.offWhiteColor(),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                    color: widget.unFocusColor ?? AppColor.borderColor()),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                    color: widget.unFocusColor ?? AppColor.borderColor()),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                    color: widget.focusColor ?? AppColor.mainAppColor()),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                    color: widget.unFocusColor ?? AppColor.borderColor()),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              suffixIconConstraints: BoxConstraints(
                  maxWidth: widget.suffixIcon != null ? 110 : 40),
              prefixIcon: widget.prefixIcon,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 35,
                    child: widget.apiResponse != null
                        ? ApiResponseWidget(
                            apiResponse: widget.apiResponse!,
                            onReload: widget.onReload,
                            isEmpty: false,
                            errorWidget: IconButton(
                              onPressed: widget.onReload,
                              icon: Icon(
                                Icons.wifi_protected_setup_rounded,
                                color: AppColor.hintColor(),
                              ),
                            ),
                            offlineWidget: GestureDetector(
                              onTap: widget.onReload,
                              child: Icon(
                                Icons.wifi_protected_setup_rounded,
                                color: AppColor.hintColor(),
                              ),
                            ),
                            loadingWidget: const CupertinoActivityIndicator(),
                            child: widget.icon ??
                                Icon(
                                  widget.items == null || widget.items!.isEmpty
                                      ? Icons.error_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  color: AppColor.hintColor(),
                                  size: 25,
                                ),
                          )
                        : widget.icon ??
                            Icon(
                              widget.items == null || widget.items!.isEmpty
                                  ? Icons.error_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              color: AppColor.hintColor(),
                              size: 25,
                            ),
                  ),
                  if (widget.suffixIcon != null) ...{
                    widget.suffixIcon ?? const SizedBox(),
                    const SizedBox(width: 10),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMultiSelectBottomSheet extends StatefulWidget {
  final List<dynamic> value;
  final List<CustomSelectItem>? items;
  final void Function(List<dynamic>)? onChanged;
  const CustomMultiSelectBottomSheet({
    super.key,
    this.value = const [],
    this.items,
    this.onChanged,
  });

  @override
  State<CustomMultiSelectBottomSheet> createState() =>
      _CustomMultiSelectBottomSheetState();
}

class _CustomMultiSelectBottomSheetState
    extends State<CustomMultiSelectBottomSheet> {
  List<dynamic> _initialValue = [];
  @override
  void initState() {
    _initialValue = List.generate(
      widget.value.length,
      (index) => widget.value[index],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColor.whiteColor(),
        borderRadius: BorderRadius.circular(15),
      ),
      constraints: BoxConstraints(
        maxHeight: CommonMethods.height(context) * 0.75,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: List.generate(
                  widget.items?.length ?? 0,
                  (index) => Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (_initialValue
                                .contains(widget.items?[index].value)) {
                              setState(() {
                                _initialValue
                                    .remove(widget.items?[index].value);
                              });
                            } else {
                              setState(() {
                                _initialValue.add(widget.items?[index].value);
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.items?[index].name ?? "",
                                    style: TextStyle(
                                      color: AppColor.darkTextColor(),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundColor: _initialValue
                                          .contains(widget.items?[index].value)
                                      ? AppColor.mainAppColor()
                                      : AppColor.greyColor(),
                                  radius: 11,
                                  child: CircleAvatar(
                                    backgroundColor: AppColor.whiteColor(),
                                    radius: 9,
                                    child: CircleAvatar(
                                      backgroundColor: _initialValue.contains(
                                              widget.items?[index].value)
                                          ? AppColor.mainAppColor()
                                          : AppColor.whiteColor(),
                                      radius: 7,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: CommonMethods.translateApi(
                      ar: 'تطبيق',
                      en: 'Done',
                      context: context,
                    ),
                    height: 40,
                    onPressed: () {
                      widget.onChanged?.call(_initialValue);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    text: CommonMethods.translateApi(
                      ar: 'إلغاء',
                      en: 'Cancel',
                      context: context,
                    ),
                    color: Colors.grey.shade600,
                    height: 40,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
