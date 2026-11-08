import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/network/connectivity_service.dart';

class ConnectivityCubit extends Cubit<bool> {
  ConnectivityCubit(this._service) : super(true) {
    _init();
  }

  final ConnectivityService _service;
  StreamSubscription<bool>? _subscription;

  Future<void> _init() async {
    final connected = await _service.isConnected;
    if (!isClosed) emit(connected);
    _subscription = _service.onStatusChanged.listen((value) {
      if (!isClosed) emit(value);
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
