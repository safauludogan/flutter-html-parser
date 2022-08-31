import 'package:flutter/material.dart';

import 'add_data_to_database.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'model/body_building_model.dart';

abstract class AddDataToDatabaseViewModel extends State<AddDataToDatabase> {
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

  getDataFromUrl(String link) async {
    List<Object> newList = [];
    List<Object> newHeaderList = [];
    List<BodyBuildingModel> bodyBuildingModel = [];
    String muscleAnatomyImage;
    String? exerciseName;
    //TargetUrl
    Uri url = Uri.parse(
        //"/exercises/cable-crunch.html");
        "https://www.muscleandstrength.com/$link");

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

    /*
    System.out.println("Video : "+doc.select("div.video-wrap > iframe").attr("src"));
    */

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
}
