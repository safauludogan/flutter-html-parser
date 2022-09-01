import 'package:flutter/material.dart';

double dynamicHeight({required double value,required BuildContext context}) =>
    MediaQuery.of(context).size.height * value;
double dynamicWidth({required double value,required BuildContext context}) =>
    MediaQuery.of(context).size.width * value;
