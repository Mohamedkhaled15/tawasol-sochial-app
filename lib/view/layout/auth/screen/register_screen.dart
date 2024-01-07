import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/helpers/utils/navigator_methods.dart';
import 'package:templet/view/custom_widgets/buttons/custom_button.dart';
import 'package:templet/view/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:templet/view/custom_widgets/page_container/page_container.dart';
import 'package:templet/view/layout/auth/screen/login_screen.dart';
import 'package:templet/view/layout/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isHidden = false;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  tr(AppLocaleKey.tawasol),
                  style: AppTextStyle.textW50B(),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  color: AppColor.whiteColor().withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFormField(
                        fillColor: AppColor.whiteColor(),
                        radius: 25,
                        hintText: tr(AppLocaleKey.name),
                      ),
                      CustomFormField(
                        fillColor: AppColor.whiteColor(),
                        radius: 25,
                        hintText: tr(AppLocaleKey.phone),
                        keyboardType: TextInputType.phone,
                      ),
                      CustomFormField(
                        fillColor: AppColor.whiteColor(),
                        radius: 25,
                        hintText: tr(AppLocaleKey.email),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      //Password V
                      CustomFormField(
                        fillColor: AppColor.whiteColor(),
                        radius: 25,
                        hintText: tr(AppLocaleKey.password),
                        isPassword: isHidden,
                        // suffixIcon: GestureDetector(
                        //     onTap: () {
                        //       setState(() {
                        //         isHidden = !isHidden;
                        //       });
                        //     },
                        //     child: isHidden
                        //         ? SvgPicture.asset(AppImages.hideIcon)
                        //         : SvgPicture.asset(AppImages.showIcon)),
                      ),
                      //Confirm Password V
                      CustomFormField(
                        fillColor: AppColor.whiteColor(),
                        radius: 25,
                        hintText: tr(AppLocaleKey.confirmPassword),
                        isPassword: isHidden,
                      ),

                      CustomButton(
                        radius: 25,
                        text: tr(AppLocaleKey.login),
                        color: AppColor.thirdAppColor(),
                        onPressed: () {
                          NavigatorMethods.pushNamed(
                              context, HomeScreen.routeName);
                        },
                      ),
                      Text(tr(AppLocaleKey.orLoginWith)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            color: AppColor.lightButtonColor(),
                            radius: 35,
                            height: 70,
                            width: 70,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                AppImages.facebookIcon,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomButton(
                            color: AppColor.lightButtonColor(),
                            radius: 35,
                            height: 70,
                            width: 70,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(
                                AppImages.googleIcon,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tr(AppLocaleKey.haveAccount),
                              style: AppTextStyle.textD16B()),
                          TextButton(
                              onPressed: () {
                                NavigatorMethods.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                tr(AppLocaleKey.login),
                                style: AppTextStyle.textM18B(),
                              )),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
