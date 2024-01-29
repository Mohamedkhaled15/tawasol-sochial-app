// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tawasol/global/services/auth.dart';
import 'package:tawasol/helpers/images/app_images.dart';
import 'package:tawasol/helpers/locale/app_locale_key.dart';
import 'package:tawasol/helpers/theme/app_colors.dart';
import 'package:tawasol/helpers/theme/app_text_style.dart';
import 'package:tawasol/helpers/utils/navigator_methods.dart';
import 'package:tawasol/view/bottom_navigation/bottom_navigation_screen.dart';
import 'package:tawasol/view/custom_widgets/buttons/custom_button.dart';
import 'package:tawasol/view/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:tawasol/view/custom_widgets/page_container/page_container.dart';
import 'package:tawasol/view/custom_widgets/validation/validation_mixin.dart';
import 'package:tawasol/view/layout/auth/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

bool isHidden = false;

class _RegisterScreenState extends State<RegisterScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  register() async {
    try {
      String res = await AuthMethods().signUp(
          email: _emailEC.text,
          password: _passwordEC.text,
          username: _nameEC.text,
          display: _confirmPasswordEC.text,
          phone: _phoneEC.text);
      if (res == 'success') {
        NavigatorMethods.pushNamedAndRemoveUntil(
            context, BottomNavigationScreen.routeName);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(res)));
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _phoneEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Column(
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
                          controller: _nameEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.name),
                        ),
                        CustomFormField(
                          controller: _phoneEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.phone),
                          keyboardType: TextInputType.phone,
                        ),
                        CustomFormField(
                          controller: _emailEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.email),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        //Password V
                        CustomFormField(
                          controller: _passwordEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.password),
                          isPassword: true,
                          // suffixIcon: isHidden
                          //     ? SvgPicture.asset(AppImages.showIcon)
                          //     : SvgPicture.asset(AppImages.hideIcon),
                          // onTap: () {
                          //   setState(() {
                          //     isHidden = !isHidden;
                          //   });
                          // },
                        ),
                        //Confirm Password V
                        CustomFormField(
                          controller: _confirmPasswordEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.confirmPassword),
                          isPassword: true,
                          // suffixIcon: isHidden
                          //     ? SvgPicture.asset(AppImages.showIcon)
                          //     : SvgPicture.asset(AppImages.hideIcon),
                          // onTap: () {
                          //   setState(() {
                          //     isHidden = !isHidden;
                          //   });
                          // },
                        ),

                        CustomButton(
                          radius: 25,
                          text: tr(AppLocaleKey.login),
                          color: AppColor.thirdAppColor(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              register();
                            }
                            // NavigatorMethods.pushNamed(
                            //     context, HomeScreen.routeName);
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
      ),
    );
  }
}
