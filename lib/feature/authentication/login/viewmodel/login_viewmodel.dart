import 'package:flutter/cupertino.dart';
import 'package:flutter_html_parser/core/base/viewmodel/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;

    @override
  void init(TickerProvider? tickerProvider) {
   
  }
}
