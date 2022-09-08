import 'package:flutter/cupertino.dart';

class PaddingItems {
  PaddingItems._();
  static var paddingScaffold =
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  static var paddingAllLow = const EdgeInsets.all(8.0);
  static var paddingAllMedium = const EdgeInsets.all(16.0);
  static var paddingAllHigh = const EdgeInsets.all(24.0);

  static var paddingBottomLow = const EdgeInsets.only(bottom: 8.0);
  static var paddingTopLow = const EdgeInsets.only(bottom: 8.0);
}
