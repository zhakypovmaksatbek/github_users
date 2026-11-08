import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_users/features/users/domain/entities/user_detail.dart';

part 'user_detail_model.freezed.dart';
part 'user_detail_model.g.dart';

@freezed
abstract class UserDetailModel with _$UserDetailModel {
  const UserDetailModel._();

  const factory UserDetailModel({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    @JsonKey(name: 'html_url') required String htmlUrl,
    String? name,
    String? bio,
    String? location,
    String? company,
    String? blog,
    @Default(0) int followers,
    @Default(0) int following,
    @JsonKey(name: 'public_repos') @Default(0) int publicRepos,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _UserDetailModel;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);

  UserDetail toEntity() => UserDetail(
    id: id,
    login: login,
    avatarUrl: avatarUrl,
    profileUrl: htmlUrl,
    name: name,
    bio: bio,
    location: location,
    company: company,
    blog: blog,
    followers: followers,
    following: following,
    publicRepos: publicRepos,
    createdAt: createdAt,
  );
}
