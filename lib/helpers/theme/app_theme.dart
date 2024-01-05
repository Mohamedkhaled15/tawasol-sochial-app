import '../hive/hive_methods.dart';
import 'theme_enum.dart';

class AppTheme {
  static dynamic getByTheme({
    required dynamic light,
    required dynamic dark,
  }) {
    switch (HiveMethods.getTheme()) {
      case ThemeEnum.light:
        return light;
      case ThemeEnum.dark:
        return dark;
    }
  }
}
