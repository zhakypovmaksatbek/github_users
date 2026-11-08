import 'package:dio/dio.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/domain/entities/user_detail.dart';

abstract interface class UsersRepository {
  Future<List<User>> getUsers({
    int since = 0,
    int perPage = 30,
    CancelToken? cancelToken,
  });

  Future<UserDetail> getUserDetail(String login, CancelToken? cancelToken);
}
