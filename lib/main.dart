import 'package:flutter/material.dart';
import 'package:flutter_html_parser/home/view/get_exercise_list_view.dart';
import 'package:flutter_html_parser/core/constants/project_items.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'core/theme/custom_theme_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ProejctItems.PROJECT_NAME,
        theme: ThemeStore.instance.getThemeData,
        home: const Scaffold(
          body: AddDataToDatabase(),
        ),
      ),
    );
  }
}
