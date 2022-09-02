import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';
import 'package:flutter_html_parser/core/widgets/lottie_widget.dart';
import 'package:flutter_html_parser/home/model/body_building_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/base/view/base_view.dart';
import '../../core/constants/height_weight.dart';
import '../../core/constants/project_items.dart';
import '../viewmodel/add_data_to_database_viewmodel.dart';

class AddDataToDatabase extends StatefulWidget {
  const AddDataToDatabase({Key? key}) : super(key: key);

  @override
  State<AddDataToDatabase> createState() => _AddDataToDatabaseState();
}

class _AddDataToDatabaseState extends State<AddDataToDatabase>
    with TickerProviderStateMixin {
  late AddDataToDatabaseViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<AddDataToDatabaseViewModel>(
        viewModel: AddDataToDatabaseViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init(this);
          viewModel = model;
        },
        onPageBuilder: (context, viewModel, isInternet) {
          return isInternet == true
              ? homeBody(bodyWidget())
              : homeBody(noInternet(context));
        });
  }

  Widget homeBody(Widget body) {
    return Scaffold(appBar: appBar, body: body);
  }

  Column noInternet(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: LottiePaths.lottie_no_internet_connection
              .toWidget(height: dynamicHeight(value: 0.3, context: context)),
        ),
        Text(ProjectItems.no_internet_connection,
            style: context.textTheme.headline6!.copyWith(color: Colors.red)),
      ],
    );
  }

  FutureBuilder<List<BodyBuildingModel>> bodyWidget() {
    return FutureBuilder(
        future: viewModel.future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Datalar indirilemedi');
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data[index].exerciseName.toString());
                },
              );
            } else {
              return const Text('Data yok');
            }
          }
          return Text(snapshot.data.toString());
        });
  }

  AppBar get appBar {
    return AppBar(
      title: Text(ProjectItems.home,
          style:
              context.textTheme.headlineSmall!.copyWith(color: Colors.white)),
      actions: [
        InkWell(
          onTap: () {
            viewModel.changeTheme();
          },
          child: LottiePaths.lottie_theme_change
              .toWidget(repeat: false, controller: viewModel.controller),
        ),
      ],
    );
  }

  Widget get floatingActionButtonChangeTheme {
    return FloatingActionButton(
      onPressed: () => viewModel.getAllExerciseLinks(),
      child: const Icon(Icons.get_app),
    );
  }
}
