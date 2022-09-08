import 'package:flutter/material.dart';
import 'package:flutter_html_parser/feature/home/model/body_building_model.dart';
import 'package:flutter_html_parser/service/i_service.dart';
import 'package:flutter_html_parser/service/project_manager.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

enum ApiQuery { exercises }

enum ApiPath {
  abductors,
  abs,
  adductors,
  biceps,
  calves,
  chest,
  forearms,
  glutes,
  hamstrings,
  hipFlexors,
  itBand,
  lats,
  lowerBack,
  middleBack,
  neck,
  obliques,
  palmarFascia,
  plantarFascia,
  quads,
  shoulders,
  traps,
  triceps
}

extension ExtensionApiQuery on ApiPath {
  String _path() {
    int pageValue = 0;
    switch (this) {
      case ApiPath.abductors:
        return '$name.html';
      case ApiPath.abs:
        return name;
      case ApiPath.adductors:
        return '$name.html';
      case ApiPath.biceps:
        return name;
      case ApiPath.calves:
        return name;
      case ApiPath.chest:
        return name;
      case ApiPath.forearms:
        return name;
      case ApiPath.glutes:
        return name;
      case ApiPath.hamstrings:
        return name;
      case ApiPath.hipFlexors:
        return 'hip-flexors';
      case ApiPath.itBand:
        return 'it-band';
      case ApiPath.lats:
        return name;
      case ApiPath.lowerBack:
        return 'lower-back';
      case ApiPath.middleBack:
        return 'middle-back';
      case ApiPath.neck:
        return '$name.html';
      case ApiPath.obliques:
        return name;
      case ApiPath.palmarFascia:
        return 'palmar-fascia';
      case ApiPath.plantarFascia:
        return 'plantar-fascia';
      case ApiPath.quads:
        return name;
      case ApiPath.shoulders:
        return name;
      case ApiPath.traps:
        return name;
      case ApiPath.triceps:
        return name;
      default:
        return ApiQuery.exercises.name;
    }
  }

  String queryPath(pageValue) {
    return '${_path()}&page=$pageValue';
  }
}

class Service extends IService {
  int pageCount = 0;
  List<BodyBuildingModel> bodyBuildingModel = [];

  @override
  Future<List<BodyBuildingModel>> fetchData() async {
    debugPrint('Başlangıç saati ${DateTime.now()}');
    bodyBuildingModel.clear();
    ApiPath apiPath;
    for (int i = 0; i < ApiPath.values.length; i++) {
      apiPath = ApiPath.values[i];
      debugPrint(
          '----------------------------------------------------------------$apiPath----------------------------------------------------------------');
      Uri url = Uri.parse(
          '${ProjectManager.baseUrl}/${ApiQuery.exercises.name}/${apiPath.queryPath(0)}');
      var document = parse((await http.Client().get(url)).body);
      try {
        pageCount = document
            .getElementsByClassName('item-list')[0]
            .getElementsByClassName('pager-item')
            .length;
      } catch (_) {
        pageCount = 0;
      }

      for (int i = 0; i <= pageCount; i++) {
        Uri url = Uri.parse(
            '${ProjectManager.baseUrl}/${ApiQuery.exercises.name}/${apiPath.queryPath(i)}');
        var document = parse((await http.Client().get(url)).body);
        for (int i = 0;
            i < document.getElementsByClassName('node-title').length;
            i++) {
          await _getDataFromUrl(document
              .getElementsByClassName('node-title')[i]
              .getElementsByTagName('a')[0]
              .attributes['href']
              .toString());
        }
      }
    }
    debugPrint('Bitiş saati ${DateTime.now()}');
    debugPrint(bodyBuildingModel.length.toString());
    return bodyBuildingModel;
  }

  _getDataFromUrl(String link) async {
    List<Object> newList = [];
    List<Object> newHeaderList = [];

    String muscleAnatomyImage;
    String? exerciseName;
    //TargetUrl
    Uri url = Uri.parse("${ProjectManager.baseUrl}/$link");

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
    debugPrint(exerciseName);
  }
}
