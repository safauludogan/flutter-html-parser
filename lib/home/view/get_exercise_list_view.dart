import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/enums/network_connectivity_enums.dart';
import 'package:flutter_html_parser/core/constants/height_weight.dart';
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
                ? Center(
                    child: LottiePaths.lottie_no_internet_connection.toWidget(
                        height: dynamicHeight(value: 0.3, context: context)),
                  )
                : FutureBuilder(
                    future: viewModel.future,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasError) {
                          return const Text('Datalar indirilemedi');
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return Text(snapshot.data[index].exerciseName.toString());
                            },
                          );
                        }else{
                           return const Text('Data yok');
                        }
                      }
                      return Text(snapshot.data.toString());
                    })),
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
