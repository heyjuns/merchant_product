part of 'connectivity_check_bloc.dart';

@freezed
class ConnectivityCheckState with _$ConnectivityCheckState {
  const factory ConnectivityCheckState.initial() = _Initial;
  const factory ConnectivityCheckState.offline() = _Offline;
  const factory ConnectivityCheckState.online() = _Online;
}
