import 'package:flutter/material.dart';
import 'package:flutter_html_parser/service/service.dart';
import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/duration_items.dart';
import '../../../core/theme/custom_theme_data.dart';
import '../model/body_building_model.dart';
import 'package:mobx/mobx.dart';

part 'add_data_to_database_viewmodel.g.dart';

class AddDataToDatabaseViewModel = _AddDataToDatabaseViewModelBase
    with _$AddDataToDatabaseViewModel;

abstract class _AddDataToDatabaseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

  @observable
  Future<List<BodyBuildingModel>>? future;

  @observable
  bool isDataGetting = false;

  @override
  void init(TickerProvider? tickerProvider) {
    controller = AnimationController(
        vsync: tickerProvider!, duration: DurationItems.durationLow());
    controller.animateTo(0.5);
  }

  bool isInternetState = false;
  bool isLight = true;
  var themeStore = ThemeStore.instance;
  late AnimationController controller;
  late TickerProvider tickerProvider;

  @observable
  List<BodyBuildingModel> bodyBuildingModel = [];

  changeTheme() {
    themeStore.changeTheme(isLight ? ThemeType.dark : ThemeType.light);
    controller.animateTo(isLight ? 1 : 0.5);
    isLight = !isLight;
  }

  @action
  Future<List<BodyBuildingModel>> getAllExerciseLinks() async {
    isDataGetting = true;
    bodyBuildingModel = await Service().fetchData();
    isDataGetting = false;
    return bodyBuildingModel;
  }
}
