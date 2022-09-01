import 'package:flutter/material.dart';

double dynamicHeight(double value, BuildContext context) =>
    MediaQuery.of(context).size.height * value;
double dynamicWidth(double value, BuildContext context) =>
    MediaQuery.of(context).size.width * value;
