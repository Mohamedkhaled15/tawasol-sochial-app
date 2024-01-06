import 'package:flutter/material.dart';
import 'package:templet/view/layout/auth/screen/login_screen.dart';
import 'package:templet/view/layout/splash/splash_screen.dart';

import '../../view/custom_widgets/zoom_image/zoom_image_screen.dart';
import '../../view/layout/home_screen.dart';

class AppRouters {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic arguments;
    if (settings.arguments != null) arguments = settings.arguments;
    switch (settings.name) {
      case ZoomImageScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => ZoomImageScreen(
            image: arguments,
          ),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      default:
        return null;
    }
  }
}
