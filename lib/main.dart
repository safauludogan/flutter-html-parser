import 'package:flutter/material.dart';
import 'package:flutter_html_parser/add_data_to_database.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: const AddDataToDatabase(),
      ),
    );
  }
}
