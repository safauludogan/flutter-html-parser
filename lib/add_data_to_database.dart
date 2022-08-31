import 'package:flutter/material.dart';

import 'add_data_to_database_viewmodel.dart';

class AddDataToDatabase extends StatefulWidget {
  const AddDataToDatabase({Key? key}) : super(key: key);

  @override
  State<AddDataToDatabase> createState() => _AddDataToDatabaseState();
}

class _AddDataToDatabaseState extends AddDataToDatabaseViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(
          'hello',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => getAllExerciseLinks(),
        child: const Icon(Icons.get_app),
      ),
      body: Container(),
    );
  }
}
