// domain/entities/user_detail.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail.freezed.dart';

@freezed
abstract class UserDetail with _$UserDetail {
  const factory UserDetail({
    required int id,
    required String login,
    required String avatarUrl,
    required String profileUrl,
    String? name,
    String? bio,
    String? location,
    String? company,
    String? blog,
    @Default(0) int followers,
    @Default(0) int following,
    @Default(0) int publicRepos,
    DateTime? createdAt,
  }) = _UserDetail;
}
