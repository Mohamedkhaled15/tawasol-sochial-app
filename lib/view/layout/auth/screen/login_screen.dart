// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:templet/global/services/auth.dart';
import 'package:templet/helpers/images/app_images.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_colors.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/helpers/utils/navigator_methods.dart';
import 'package:templet/view/custom_widgets/buttons/custom_button.dart';
import 'package:templet/view/custom_widgets/custom_form_field/custom_form_field.dart';
import 'package:templet/view/custom_widgets/page_container/page_container.dart';
import 'package:templet/view/custom_widgets/validation/validation_mixin.dart';
import 'package:templet/view/layout/auth/screen/register_screen.dart';
import 'package:templet/view/layout/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  signIn() async {
    try {
      String res = await AuthMethods()
          .signIn(email: _emailEC.text, password: _passwordEC.text);

      if (res == 'success') {
        NavigatorMethods.pushNamedAndRemoveUntil(
          context,
          HomeScreen.routeName,
        );
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
    _emailEC.dispose();
    _passwordEC.dispose();
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
                  child: Hero(
                    tag: 22,
                    child: Text(
                      tr(AppLocaleKey.tawasol),
                      style: AppTextStyle.textW50B(),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
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
                          controller: _emailEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.email),
                        ),
                        CustomFormField(
                          controller: _passwordEC,
                          fillColor: AppColor.whiteColor(),
                          radius: 25,
                          hintText: tr(AppLocaleKey.password),
                        ),
                        Text(tr(AppLocaleKey.forgetPassword),
                            style: AppTextStyle.textM16B()),
                        CustomButton(
                          radius: 25,
                          text: tr(AppLocaleKey.login),
                          color: AppColor.thirdAppColor(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              signIn();
                            }
                          },
                        ),
                        Text(tr(AppLocaleKey.orLoginWith),
                            style: AppTextStyle.textD16B()),
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
                            Text(tr(AppLocaleKey.dontHaveAccount),
                                style: AppTextStyle.textD16B()),
                            TextButton(
                                onPressed: () {
                                  NavigatorMethods.pushNamed(
                                      context, RegisterScreen.routeName);
                                },
                                child: Text(
                                  tr(AppLocaleKey.signUp),
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
