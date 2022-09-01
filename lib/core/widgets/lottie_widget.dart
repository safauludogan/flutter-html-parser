import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: constant_identifier_names
enum LottiePaths { lottie_theme_change, lottie_no_internet_connection }

extension LottieExtension on LottiePaths {
  String _path() {
    switch (this) {
      case LottiePaths.lottie_theme_change:
        return name;
      case LottiePaths.lottie_no_internet_connection:
        return name;
    }
  }

  String get _lottiePath => 'assets/lottie/${_path()}.json';

  Widget toWidget({double height = 24, bool repeat = true, controller}) {
    return Lottie.asset(_lottiePath,
        height: height, repeat: repeat, controller: controller);
  }
}
