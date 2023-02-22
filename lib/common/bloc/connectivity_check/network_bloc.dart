import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:news_app/common/api/api_client.dart';
import 'package:news_app/common/network/network_connection_helper.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event, emit) {
    NetworkConnectionHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    logger.d("_notifyStatus ${event.isConnected}");
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
