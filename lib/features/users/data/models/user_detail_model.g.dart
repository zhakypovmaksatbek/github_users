// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    _UserDetailModel(
      id: (json['id'] as num).toInt(),
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      htmlUrl: json['html_url'] as String,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      company: json['company'] as String?,
      blog: json['blog'] as String?,
      followers: (json['followers'] as num?)?.toInt() ?? 0,
      following: (json['following'] as num?)?.toInt() ?? 0,
      publicRepos: (json['public_repos'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$UserDetailModelToJson(_UserDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'html_url': instance.htmlUrl,
      'name': instance.name,
      'bio': instance.bio,
      'location': instance.location,
      'company': instance.company,
      'blog': instance.blog,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.publicRepos,
      'created_at': instance.createdAt?.toIso8601String(),
    };
