part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkObserve extends NetworkEvent {}

class NetworkNotify extends NetworkEvent {
  final bool isConnected;

  NetworkNotify({this.isConnected = false});
}
