part of 'connectivity_check_bloc.dart';

@freezed
abstract class ConnectivityCheckEvent with _$ConnectivityCheckEvent {
  const factory ConnectivityCheckEvent.check() = _Check;
}
