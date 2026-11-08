import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin CancelableMixin<S> on BlocBase<S> {
  final Map<String, CancelToken> _tokens = {};

  CancelToken renewCancelToken(String key) {
    _tokens[key]?.cancel('renew');
    return _tokens[key] = CancelToken();
  }

  void cancelToken(String key) => _tokens.remove(key)?.cancel('cancel');

  @override
  Future<void> close() {
    for (final token in _tokens.values) {
      token.cancel('close');
    }
    _tokens.clear();
    return super.close();
  }
}
