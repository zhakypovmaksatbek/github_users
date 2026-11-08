// data/repositories/users_repository_impl.dart
import 'package:dio/dio.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/features/users/data/datasources/github_api.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/domain/entities/user_detail.dart';
import 'package:github_users/features/users/domain/repositories/users_repository.dart';

final class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl(this._api);
  final GithubApi _api;

  @override
  Future<List<User>> getUsers({
    int since = 0,
    int perPage = 30,
    CancelToken? cancelToken,
  }) {
    return _guard(() async {
      final models = await _api.getUsers(since, perPage, cancelToken);
      return models.map((m) => m.toEntity()).toList();
    });
  }

  @override
  Future<UserDetail> getUserDetail(String login, CancelToken? cancelToken) {
    return _guard(
      () async => (await _api.getUser(login, cancelToken)).toEntity(),
    );
  }

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _mapDioException(e);
    } catch (e) {
      throw UnknownFailure(e.toString());
    }
  }

  Failure _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NoInternetFailure();
      case DioExceptionType.badResponse:
        final status = e.response?.statusCode;
        final headers = e.response?.headers;
        final remaining = headers?.value('x-ratelimit-remaining');
        final retryAfter = headers?.value('retry-after');

        if (status == 429 ||
            (status == 403 && (remaining == '0' || retryAfter != null))) {
          return RateLimitFailure(resetsAt: _rateLimitReset(headers));
        }
        if (status == 404) return const NotFoundFailure();
        return UnknownFailure(e.message);
      default:
        return UnknownFailure(e.message);
    }
  }

  DateTime? _rateLimitReset(Headers? headers) {
    final seconds = int.tryParse(headers?.value('x-ratelimit-reset') ?? '');
    if (seconds == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true);
  }
}
