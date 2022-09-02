import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/constants/project_items.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../utils/context_extension.dart';

import '../../constants/enums/network_connectivity_enums.dart';
import '../../constants/height_weight.dart';

import '../../widgets/lottie_widget.dart';
import '../viewmodel/internet_control_viewmodel/viewmodel.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, bool isInternet)
      onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;
  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
  }) : super(key: key);
  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  var baseInternetControlViewModel = InternetControl();

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    baseInternetControlViewModel.checkFirstTimeInternetConnection();
    baseInternetControlViewModel.networkConnectivity
        .handleNetworkConnectivity((result) {
      baseInternetControlViewModel.networkConnectivityEnums = result;
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) =>
          baseInternetControlViewModel.networkConnectivityEnums ==
                  NetworkConnectivityEnums.off
              ? widget.onPageBuilder(context, model, false)
              : widget.onPageBuilder(context, model, true),
    );
  }
}
