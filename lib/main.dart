import 'package:bot_toast/bot_toast.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:templet/firebase_options.dart';
import 'package:templet/view/bottom_navigation/bottom_navigation_screen.dart';
import 'package:templet/view/layout/auth/screen/login_screen.dart';

import 'package:timeago/timeago.dart' as timeago;

import 'helpers/routes/app_routers.dart';
import 'helpers/theme/style.dart';
import 'helpers/theme/theme_enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ThemeEnumAdapter());
  await Hive.openBox('app');
  timeago.setLocaleMessages('en', timeago.EnMessages());
  timeago.setLocaleMessages('en_short', timeago.EnShortMessages());
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'i18n',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setMyAppState(BuildContext context) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setMyAppState();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void setMyAppState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tawasol Social App",
      localizationsDelegates: [
        ...context.localizationDelegates,
        CountryLocalizations.delegate,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: appThemeData(context),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: AppRouters.onGenerateRoute,
      navigatorKey: AppRouters.navigatorKey,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNavigationScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
