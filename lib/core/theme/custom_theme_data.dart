import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/theme/theme_dark.dart';
import 'package:flutter_html_parser/core/theme/theme_light.dart';
import 'package:mobx/mobx.dart';

part 'custom_theme_data.g.dart';

enum ThemeType { light, dark }

class ThemeStore extends TThemeStore {
  ThemeStore._privateContructor();
  static final ThemeStore _instance = ThemeStore._privateContructor();
  static ThemeStore get instance => _instance;
}

class TThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  late final ThemeData _lightData = ThemeLight.instance.theme!;
  late final ThemeData _darkData = ThemeDark.instance.theme!;

  @observable
  ThemeType currentThemeType = ThemeType.light;

  @computed
  ThemeData get getThemeData =>
      (currentThemeType == ThemeType.light) ? _lightData : _darkData;

  @action
  void changeTheme(ThemeType data) {
    currentThemeType = data;
  }
}
