import 'package:flutter/material.dart';

import '../theme/custom_theme_data.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => ThemeStore.instance.getThemeData;
  Size get mediaQuery => MediaQuery.of(this).size;
}
