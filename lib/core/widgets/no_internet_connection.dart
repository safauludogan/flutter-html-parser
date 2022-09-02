import 'package:flutter/material.dart';
import 'package:flutter_html_parser/core/utils/context_extension.dart';

import '../constants/height_weight.dart';
import '../constants/project_items.dart';
import 'lottie_widget.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        child: LottiePaths.lottie_no_internet_connection
            .toWidget(height: dynamicHeight(value: 0.3, context: context)),
      ),
      Text(ProjectItems.no_internet_connection,
          style: context.textTheme.headline6!.copyWith(color: Colors.red)),
    ]);
  }
}
