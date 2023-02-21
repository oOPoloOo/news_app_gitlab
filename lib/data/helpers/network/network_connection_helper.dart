import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/data/api/api_client.dart';
import 'package:news_app/logic/connectivity_check/network_bloc.dart';

class NetworkConnectionHelper {
  static void observeNetwork() async {
    // ConnectivityResult mobile = ConnectivityResult.mobile;
    // ConnectivityResult wifi = ConnectivityResult.wifi;
    // ConnectivityResult ethernet = ConnectivityResult.ethernet;

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      NetworkBloc().add(NetworkNotify());
    } else {
      NetworkBloc().add(NetworkNotify(isConnected: true));
    }
    // else {
    //   logger.d('NetworkConnectionHelper neateina nei i viena ');
    // }

    // Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
    //   if (result == ConnectivityResult.none) {
    //     NetworkBloc().add(NetworkNotify());
    //   } else {
    //     NetworkBloc().add(NetworkNotify(isConnected: true));
    //   }
    // });
  }
}
