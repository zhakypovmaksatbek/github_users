import 'package:dio/dio.dart';
import 'package:github_users/features/users/data/models/user_detail_model.dart';
import 'package:github_users/features/users/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'github_api.g.dart';

@RestApi()
abstract class GithubApi {
  factory GithubApi(Dio dio, {String? baseUrl}) = _GithubApi;

  @GET('/users')
  Future<List<UserModel>> getUsers(
    @Query('since') int since,
    @Query('per_page') int perPage,
    @CancelRequest() CancelToken? cancelToken,
  );

  @GET('/users/{login}')
  Future<UserDetailModel> getUser(
    @Path('login') String login,
    @CancelRequest() CancelToken? cancelToken,
  );
}
