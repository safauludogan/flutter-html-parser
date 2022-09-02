import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
//part 'base_view_model.g.dart';
/*abstract class BaseViewModel {
  late BuildContext baseContext;
  void setContext(BuildContext context);
  void init(TickerProvider? tickerProvider);
}*/

 abstract class BaseViewModel{
  late BuildContext baseContext;
  void setContext(BuildContext context);
  void init(TickerProvider? tickerProvider);
}
