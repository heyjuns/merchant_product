import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'connectivity_check_event.dart';
part 'connectivity_check_state.dart';
part 'connectivity_check_bloc.freezed.dart';

class ConnectivityCheckBloc
    extends Bloc<ConnectivityCheckEvent, ConnectivityCheckState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _sub;

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }

  ConnectivityCheckBloc() : super(_Initial()) {
    on<_Check>((event, emit) async {
      final result = await _connectivity.checkConnectivity();
      emit(_map(result));

      await emit.forEach<List<ConnectivityResult>>(
        _connectivity.onConnectivityChanged,
        onData: (data) => _map(data),
      );
    });
  }
  ConnectivityCheckState _map(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.none)
        ? const ConnectivityCheckState.offline()
        : ConnectivityCheckState.online();
  }
}
