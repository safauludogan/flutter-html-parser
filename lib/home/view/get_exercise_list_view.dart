import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/enums/network_connectivity_enums.dart';
import 'package:flutter_html_parser/core/widgets/lottie_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/base/view/base_view.dart';
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
        model.networkConnectivity.handleNetworkConnectivity((result) {
          model.networkConnectivityEnums = result;
        });
        viewModel = model;
      },
      onPageBuilder: (context, viewModel) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButtonChangeTheme,
        body: Observer(
            builder: (context) => viewModel.networkConnectivityEnums ==
                    NetworkConnectivityEnums.off
                ? const Text('internet Yok')
                : const Text('internet  Var')),
      );

  AppBar get appBar {
    return AppBar(
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
