import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get mediaQuery => MediaQuery.of(this).size;
}
