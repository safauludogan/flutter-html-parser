import 'package:mobx/mobx.dart';

import '../../../constants/enums/network_connectivity_enums.dart';
import '../../../network/connectivity/network_connectivity.dart';
import '../../../network/connectivity/network_connectivity_interface.dart';
part 'viewmodel.g.dart';

class InternetControl = _InternetControlBase with _$InternetControl;

abstract class _InternetControlBase with Store {
  @observable
  NetworkConnectivityEnums? networkConnectivityEnums;
  late NetworkConnectivityInterface networkConnectivity;
  @action
  Future<void> checkFirstTimeInternetConnection() async {
    networkConnectivity = NetworkConnectivity();
    networkConnectivityEnums =
        await networkConnectivity.checkNetworkConnectivity();
  }
}
