import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/height_weight.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';
import 'package:flutter_html_parser/core/widgets/image_widget.dart';
import 'package:flutter_html_parser/core/widgets/lottie_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/padding_items.dart';
import '../../../core/constants/project_items.dart';
import '../../../core/widgets/no_internet_connection.dart';
import '../viewmodel/add_data_to_database_viewmodel.dart';

class ExerciseListView extends StatefulWidget {
  const ExerciseListView({Key? key}) : super(key: key);

  @override
  State<ExerciseListView> createState() => _ExerciseListViewState();
}

class _ExerciseListViewState extends State<ExerciseListView>
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
              : homeBody(const NoInternetConnection());
        });
  }

  Widget homeBody(Widget body) {
    return Observer(
      builder: (context) => Scaffold(
          floatingActionButton: viewModel.isDataGetting == false
              ? floatingActionButtonChangeTheme
              : const SizedBox.shrink(),
          appBar: appBar,
          body: Padding(
            padding: PaddingItems.paddingScaffold,
            child: body,
          )),
    );
  }

  Widget bodyWidget() {
    return Observer(
      builder: (context) => FutureBuilder(
          future: viewModel.future,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Center(
                    child: ImagePaths.image_404.toWidget(
                        height: dynamicHeight(
                            context: context,
                            value: context.mediaQuery.height * 0.01)));
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length + 1,
                  itemBuilder: (context, index) {
                    if (index != snapshot.data.length) {
                      var indexItem = snapshot.data[index];
                      return Padding(
                        padding: PaddingItems.paddingBottomLow,
                        child: _customCard(indexItem, context),
                      );
                    } else {
                      return SizedBox(
                        height: dynamicHeight(value: 0.1, context: context),
                      );
                    }
                  },
                );
              } else if (!snapshot.hasData) {
                return _noDataText(context, ProjectItems.dataNotGetYet);
              } else {
                return _noDataText(context, ProjectItems.noData);
              }
            }
          }),
    );
  }

  Card _customCard(indexItem, BuildContext context) {
    return Card(
        elevation: 10,
        child: Padding(
          padding: PaddingItems.paddingAllLow,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _basicText(indexItem, context, ProjectItems.exercise,
                        indexItem.exerciseName.toString(),
                        style: context.textTheme.headline6),
                    SizedBox(
                        height: dynamicHeight(value: 0.02, context: context)),
                    _basicText(indexItem, context, ProjectItems.targetMuscle,
                        indexItem.targetMuscleGroup.toString()),
                    SizedBox(
                        height: dynamicHeight(value: 0.01, context: context)),
                    _basicText(indexItem, context, ProjectItems.exerciseType,
                        indexItem.exerciseType.toString()),
                    SizedBox(
                        height: dynamicHeight(value: 0.01, context: context)),
                    _basicText(indexItem, context, ProjectItems.equipment,
                        indexItem.equipmentRequired.toString()),
                    SizedBox(
                        height: dynamicHeight(value: 0.01, context: context)),
                    _basicText(indexItem, context, ProjectItems.mechanic,
                        indexItem.mechanics.toString()),
                    SizedBox(
                        height: dynamicHeight(value: 0.01, context: context)),
                    _basicText(indexItem, context, ProjectItems.force,
                        indexItem.forceType.toString()),
                    SizedBox(
                        height: dynamicHeight(value: 0.01, context: context)),
                    _basicText(indexItem, context, ProjectItems.experienceLevel,
                        indexItem.experienceLevel.toString()),
                    SizedBox(
                        height: dynamicHeight(value: 0.01, context: context)),
                    _basicText(
                        indexItem,
                        context,
                        ProjectItems.secondaryMuscles,
                        indexItem.secondaryMuscles.toString()),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.network(indexItem.muscleAnatomyImage),
              )
            ],
          ),
        ));
  }

  Text _basicText(indexItem, BuildContext context, header, indextText,
      {TextStyle? style}) {
    return Text(
      '$header : $indextText',
      style: style,
    );
  }

  Widget _noDataText(BuildContext context, text) {
    return Center(child: Text(text, style: context.textTheme.headline5));
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
      onPressed: () {
        viewModel.future = viewModel.getAllExerciseLinks()
          ..then((value) {
            viewModel.future = Future.value(value);
          });
      },
      child: const Icon(Icons.get_app),
    );
  }
}
