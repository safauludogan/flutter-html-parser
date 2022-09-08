import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/project_items.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'feature/authentication/login/view/login_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ProjectItems.PROJECT_NAME,
        theme: context.theme,
        home: const Scaffold(
          body: LoginView(),
        ),
      ),
    );
  }
}
