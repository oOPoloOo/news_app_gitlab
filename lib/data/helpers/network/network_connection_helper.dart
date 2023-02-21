import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/logic/connectivity_check/network_bloc.dart';

class NetworkConnectionHelper {
  static void observeNetwork() async {
    //First time
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      NetworkBloc().add(NetworkNotify());
    } else {
      NetworkBloc().add(NetworkNotify(isConnected: true));
    }

    // Then listen to changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
