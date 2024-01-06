import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:templet/helpers/locale/app_locale_key.dart';
import 'package:templet/helpers/theme/app_text_style.dart';
import 'package:templet/helpers/utils/navigator_methods.dart';
import 'package:templet/view/custom_widgets/page_container/page_container.dart';
import 'package:templet/view/layout/auth/screen/login_screen.dart';
import 'package:templet/view/layout/splash/widgets/rotated_container.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        // NavigatorMethods.pushNamed(context, LoginScreen.routeName,);
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Hero(
              tag: 22,
              child: Text(
                tr(AppLocaleKey.tawasol),
                style: AppTextStyle.textW50B(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                RotatedContainer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RotatedContainer(),
                    SizedBox(
                      width: 30,
                    ),
                    RotatedContainer(),
                  ],
                ),
                RotatedContainer(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
