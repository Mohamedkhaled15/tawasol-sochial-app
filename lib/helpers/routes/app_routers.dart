import 'package:flutter/material.dart';

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

      default:
        return null;
    }
  }
}
