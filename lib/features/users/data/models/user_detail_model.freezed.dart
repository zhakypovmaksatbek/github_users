// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetailModel {

 int get id; String get login;@JsonKey(name: 'avatar_url') String get avatarUrl;@JsonKey(name: 'html_url') String get htmlUrl; String? get name; String? get bio; String? get location; String? get company; String? get blog; int get followers; int get following;@JsonKey(name: 'public_repos') int get publicRepos;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDetailModelCopyWith<UserDetailModel> get copyWith => _$UserDetailModelCopyWithImpl<UserDetailModel>(this as UserDetailModel, _$identity);

  /// Serializes this UserDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDetailModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.login, _this.login) || other.login == _this.login)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.htmlUrl, _this.htmlUrl) || other.htmlUrl == _this.htmlUrl)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.bio, _this.bio) || other.bio == _this.bio)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.company, _this.company) || other.company == _this.company)&&(identical(other.blog, _this.blog) || other.blog == _this.blog)&&(identical(other.followers, _this.followers) || other.followers == _this.followers)&&(identical(other.following, _this.following) || other.following == _this.following)&&(identical(other.publicRepos, _this.publicRepos) || other.publicRepos == _this.publicRepos)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserDetailModel;
  return Object.hash(runtimeType,_this.id,_this.login,_this.avatarUrl,_this.htmlUrl,_this.name,_this.bio,_this.location,_this.company,_this.blog,_this.followers,_this.following,_this.publicRepos,_this.createdAt);
}

@override
String toString() {
  final _this = this as UserDetailModel;
  return 'UserDetailModel(id: ${_this.id}, login: ${_this.login}, avatarUrl: ${_this.avatarUrl}, htmlUrl: ${_this.htmlUrl}, name: ${_this.name}, bio: ${_this.bio}, location: ${_this.location}, company: ${_this.company}, blog: ${_this.blog}, followers: ${_this.followers}, following: ${_this.following}, publicRepos: ${_this.publicRepos}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $UserDetailModelCopyWith<$Res>  {
  factory $UserDetailModelCopyWith(UserDetailModel value, $Res Function(UserDetailModel) _then) = _$UserDetailModelCopyWithImpl;
@useResult
$Res call({
 int id, String login,@JsonKey(name: 'avatar_url') String avatarUrl,@JsonKey(name: 'html_url') String htmlUrl, String? name, String? bio, String? location, String? company, String? blog, int followers, int following,@JsonKey(name: 'public_repos') int publicRepos,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$UserDetailModelCopyWithImpl<$Res>
    implements $UserDetailModelCopyWith<$Res> {
  _$UserDetailModelCopyWithImpl(this._self, this._then);

  final UserDetailModel _self;
  final $Res Function(UserDetailModel) _then;

/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? login = null,Object? avatarUrl = null,Object? htmlUrl = null,Object? name = freezed,Object? bio = freezed,Object? location = freezed,Object? company = freezed,Object? blog = freezed,Object? followers = null,Object? following = null,Object? publicRepos = null,Object? createdAt = freezed,}) {
  return _then(UserDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,blog: freezed == blog ? _self.blog : blog // ignore: cast_nullable_to_non_nullable
as String?,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,publicRepos: null == publicRepos ? _self.publicRepos : publicRepos // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDetailModel].
extension UserDetailModelPatterns on UserDetailModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _UserDetailModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String login, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'html_url')  String htmlUrl,  String? name,  String? bio,  String? location,  String? company,  String? blog,  int followers,  int following, @JsonKey(name: 'public_repos')  int publicRepos, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
return $default(_that.id,_that.login,_that.avatarUrl,_that.htmlUrl,_that.name,_that.bio,_that.location,_that.company,_that.blog,_that.followers,_that.following,_that.publicRepos,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String login, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'html_url')  String htmlUrl,  String? name,  String? bio,  String? location,  String? company,  String? blog,  int followers,  int following, @JsonKey(name: 'public_repos')  int publicRepos, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserDetailModel():
return $default(_that.id,_that.login,_that.avatarUrl,_that.htmlUrl,_that.name,_that.bio,_that.location,_that.company,_that.blog,_that.followers,_that.following,_that.publicRepos,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String login, @JsonKey(name: 'avatar_url')  String avatarUrl, @JsonKey(name: 'html_url')  String htmlUrl,  String? name,  String? bio,  String? location,  String? company,  String? blog,  int followers,  int following, @JsonKey(name: 'public_repos')  int publicRepos, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDetailModel() when $default != null:
return $default(_that.id,_that.login,_that.avatarUrl,_that.htmlUrl,_that.name,_that.bio,_that.location,_that.company,_that.blog,_that.followers,_that.following,_that.publicRepos,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDetailModel extends UserDetailModel {
  const _UserDetailModel({required this.id, required this.login, @JsonKey(name: 'avatar_url') required this.avatarUrl, @JsonKey(name: 'html_url') required this.htmlUrl, this.name, this.bio, this.location, this.company, this.blog, this.followers = 0, this.following = 0, @JsonKey(name: 'public_repos') this.publicRepos = 0, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _UserDetailModel.fromJson(Map<String, dynamic> json) => _$UserDetailModelFromJson(json);

@override final  int id;
@override final  String login;
@override@JsonKey(name: 'avatar_url') final  String avatarUrl;
@override@JsonKey(name: 'html_url') final  String htmlUrl;
@override final  String? name;
@override final  String? bio;
@override final  String? location;
@override final  String? company;
@override final  String? blog;
@override@JsonKey() final  int followers;
@override@JsonKey() final  int following;
@override@JsonKey(name: 'public_repos') final  int publicRepos;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDetailModelCopyWith<_UserDetailModel> get copyWith => __$UserDetailModelCopyWithImpl<_UserDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.location, location) || other.location == location)&&(identical(other.company, company) || other.company == company)&&(identical(other.blog, blog) || other.blog == blog)&&(identical(other.followers, followers) || other.followers == followers)&&(identical(other.following, following) || other.following == following)&&(identical(other.publicRepos, publicRepos) || other.publicRepos == publicRepos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,login,avatarUrl,htmlUrl,name,bio,location,company,blog,followers,following,publicRepos,createdAt);
}

@override
String toString() {
    return 'UserDetailModel(id: $id, login: $login, avatarUrl: $avatarUrl, htmlUrl: $htmlUrl, name: $name, bio: $bio, location: $location, company: $company, blog: $blog, followers: $followers, following: $following, publicRepos: $publicRepos, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserDetailModelCopyWith<$Res> implements $UserDetailModelCopyWith<$Res> {
  factory _$UserDetailModelCopyWith(_UserDetailModel value, $Res Function(_UserDetailModel) _then) = __$UserDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String login,@JsonKey(name: 'avatar_url') String avatarUrl,@JsonKey(name: 'html_url') String htmlUrl, String? name, String? bio, String? location, String? company, String? blog, int followers, int following,@JsonKey(name: 'public_repos') int publicRepos,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$UserDetailModelCopyWithImpl<$Res>
    implements _$UserDetailModelCopyWith<$Res> {
  __$UserDetailModelCopyWithImpl(this._self, this._then);

  final _UserDetailModel _self;
  final $Res Function(_UserDetailModel) _then;

/// Create a copy of UserDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? login = null,Object? avatarUrl = null,Object? htmlUrl = null,Object? name = freezed,Object? bio = freezed,Object? location = freezed,Object? company = freezed,Object? blog = freezed,Object? followers = null,Object? following = null,Object? publicRepos = null,Object? createdAt = freezed,}) {
  return _then(_UserDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,blog: freezed == blog ? _self.blog : blog // ignore: cast_nullable_to_non_nullable
as String?,followers: null == followers ? _self.followers : followers // ignore: cast_nullable_to_non_nullable
as int,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as int,publicRepos: null == publicRepos ? _self.publicRepos : publicRepos // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
