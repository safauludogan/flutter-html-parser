import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import '../../core/base/viewmodel/base_view_model.dart';
import '../../core/constants/duration_items.dart';
import '../../core/constants/enums/network_connectivity_enums.dart';
import '../../core/network/connectivity/network_connectivity.dart';
import '../../core/network/connectivity/network_connectivity_interface.dart';
import '../../core/theme/custom_theme_data.dart';
import '../model/body_building_model.dart';
import 'package:mobx/mobx.dart';

part 'add_data_to_database_viewmodel.g.dart';

class AddDataToDatabaseViewModel = _AddDataToDatabaseViewModelBase
    with _$AddDataToDatabaseViewModel;

abstract class _AddDataToDatabaseViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
  void init(TickerProvider? tickerProvider) {
    controller = AnimationController(
        vsync: tickerProvider!, duration: DurationItems.durationLow());
    controller.animateTo(0.5);
    networkConnectivity = NetworkConnectivity();
    checkFirstTimeInternetConnection();
  }

  bool isLight = true;
  var themeStore = ThemeStore.instance;
  late AnimationController controller;
  late TickerProvider tickerProvider;
  late NetworkConnectivityInterface networkConnectivity;

  @observable
  List<BodyBuildingModel> bodyBuildingModel = [];
  @observable
  NetworkConnectivityEnums? networkConnectivityEnums;

  changeTheme() {
    themeStore.changeTheme(isLight ? ThemeType.dark : ThemeType.light);
    controller.animateTo(isLight ? 1 : 0.5);
    isLight = !isLight;
  }

  @action
  getAllExerciseLinks() async {
    Uri url =
        Uri.parse('https://www.muscleandstrength.com/exercises/adductors.html');
    var document = parse((await http.Client().get(url)).body);

    for (int i = 0;
        i < document.getElementsByClassName('node-title').length;
        i++) {
      getDataFromUrl(document
          .getElementsByClassName('node-title')[i]
          .getElementsByTagName('a')[0]
          .attributes['href']
          .toString());
    }
  }

  @action
  getDataFromUrl(String link) async {
    List<Object> newList = [];
    List<Object> newHeaderList = [];

    String muscleAnatomyImage;
    String? exerciseName;
    //TargetUrl
    Uri url = Uri.parse("https://www.muscleandstrength.com/$link");

    var document = parse((await http.Client().get(url)).body);
    var headerLength = document
        .getElementsByClassName('node-stats-block')[0]
        .getElementsByTagName('span.row-label')
        .length;

    //Exercise profile datalarını çekiyoruz
    for (int i = 0; i < headerLength; i++) {
      newHeaderList.add(document
          .getElementsByClassName('node-stats-block')[0]
          .getElementsByTagName('span.row-label')[i]
          .text);

      var indexElement = document
          .getElementsByClassName('node-stats-block')[0]
          .getElementsByTagName('ul')[0]
          .getElementsByTagName('li')[i]
          .text;

      //Exercise profile'da dataların karşılığını çekiyoruz.
      newList
          .add(indexElement.replaceAll(newHeaderList[i].toString(), '').trim());
    }

    //Title
    for (int i = 0; i < document.getElementsByTagName('meta').length; i++) {
      try {
        if (document.getElementsByTagName('meta')[i].attributes['name'] ==
            'twitter:title') {
          exerciseName =
              document.getElementsByTagName('meta')[i].attributes['content'];
          break;
        }
      } catch (error) {
        //if (kDebugMode) debugPrint(error.toString());
      }
    }

    //Muscle Anatomy Image Get
    muscleAnatomyImage = document
        .getElementsByClassName('bp600-8')[1]
        .querySelector('img')!
        .attributes['src']
        .toString()
        .trim();

    bodyBuildingModel.add(BodyBuildingModel(
      exerciseName: exerciseName,
      targetMuscleGroup: newList[0].toString(),
      exerciseType: newList[1].toString(),
      equipmentRequired: newList[2].toString(),
      mechanics: newList[3].toString(),
      forceType: newList[4].toString(),
      experienceLevel: newList[5].toString(),
      muscleAnatomyImage: muscleAnatomyImage,
      secondaryMuscles: (SecondaryMuscles(
          element: newList[6].toString().split(',').toString())),
    ));
    debugPrint(bodyBuildingModel.toString());
  }

  @action
  Future<void> checkFirstTimeInternetConnection() async {
    networkConnectivityEnums =
        await networkConnectivity.checkNetworkConnectivity();
    debugPrint(networkConnectivityEnums.toString());
  }
}
