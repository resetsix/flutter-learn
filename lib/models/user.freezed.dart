// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRes implements DiagnosticableTreeMixin {

 List<UserPost> get posts; List<UserComment> get comments; UserProfile? get profile;
/// Create a copy of UserRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserResCopyWith<UserRes> get copyWith => _$UserResCopyWithImpl<UserRes>(this as UserRes, _$identity);

  /// Serializes this UserRes to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserRes'))
    ..add(DiagnosticsProperty('posts', posts))..add(DiagnosticsProperty('comments', comments))..add(DiagnosticsProperty('profile', profile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRes&&const DeepCollectionEquality().equals(other.posts, posts)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(posts),const DeepCollectionEquality().hash(comments),profile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserRes(posts: $posts, comments: $comments, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $UserResCopyWith<$Res>  {
  factory $UserResCopyWith(UserRes value, $Res Function(UserRes) _then) = _$UserResCopyWithImpl;
@useResult
$Res call({
 List<UserPost> posts, List<UserComment> comments, UserProfile? profile
});


$UserProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class _$UserResCopyWithImpl<$Res>
    implements $UserResCopyWith<$Res> {
  _$UserResCopyWithImpl(this._self, this._then);

  final UserRes _self;
  final $Res Function(UserRes) _then;

/// Create a copy of UserRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posts = null,Object? comments = null,Object? profile = freezed,}) {
  return _then(_self.copyWith(
posts: null == posts ? _self.posts : posts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<UserComment>,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}
/// Create a copy of UserRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserRes].
extension UserResPatterns on UserRes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRes value)  $default,){
final _that = this;
switch (_that) {
case _UserRes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRes value)?  $default,){
final _that = this;
switch (_that) {
case _UserRes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserPost> posts,  List<UserComment> comments,  UserProfile? profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRes() when $default != null:
return $default(_that.posts,_that.comments,_that.profile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserPost> posts,  List<UserComment> comments,  UserProfile? profile)  $default,) {final _that = this;
switch (_that) {
case _UserRes():
return $default(_that.posts,_that.comments,_that.profile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserPost> posts,  List<UserComment> comments,  UserProfile? profile)?  $default,) {final _that = this;
switch (_that) {
case _UserRes() when $default != null:
return $default(_that.posts,_that.comments,_that.profile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserRes with DiagnosticableTreeMixin implements UserRes {
  const _UserRes({final  List<UserPost> posts = const [], final  List<UserComment> comments = const [], this.profile}): _posts = posts,_comments = comments;
  factory _UserRes.fromJson(Map<String, dynamic> json) => _$UserResFromJson(json);

 final  List<UserPost> _posts;
@override@JsonKey() List<UserPost> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

 final  List<UserComment> _comments;
@override@JsonKey() List<UserComment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  UserProfile? profile;

/// Create a copy of UserRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserResCopyWith<_UserRes> get copyWith => __$UserResCopyWithImpl<_UserRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserResToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserRes'))
    ..add(DiagnosticsProperty('posts', posts))..add(DiagnosticsProperty('comments', comments))..add(DiagnosticsProperty('profile', profile));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRes&&const DeepCollectionEquality().equals(other._posts, _posts)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.profile, profile) || other.profile == profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),const DeepCollectionEquality().hash(_comments),profile);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserRes(posts: $posts, comments: $comments, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$UserResCopyWith<$Res> implements $UserResCopyWith<$Res> {
  factory _$UserResCopyWith(_UserRes value, $Res Function(_UserRes) _then) = __$UserResCopyWithImpl;
@override @useResult
$Res call({
 List<UserPost> posts, List<UserComment> comments, UserProfile? profile
});


@override $UserProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class __$UserResCopyWithImpl<$Res>
    implements _$UserResCopyWith<$Res> {
  __$UserResCopyWithImpl(this._self, this._then);

  final _UserRes _self;
  final $Res Function(_UserRes) _then;

/// Create a copy of UserRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? comments = null,Object? profile = freezed,}) {
  return _then(_UserRes(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<UserComment>,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as UserProfile?,
  ));
}

/// Create a copy of UserRes
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// @nodoc
mixin _$UserPost implements DiagnosticableTreeMixin {

 int? get id; String? get title;
/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPostCopyWith<UserPost> get copyWith => _$UserPostCopyWithImpl<UserPost>(this as UserPost, _$identity);

  /// Serializes this UserPost to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserPost'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserPost(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $UserPostCopyWith<$Res>  {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) _then) = _$UserPostCopyWithImpl;
@useResult
$Res call({
 int? id, String? title
});




}
/// @nodoc
class _$UserPostCopyWithImpl<$Res>
    implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._self, this._then);

  final UserPost _self;
  final $Res Function(UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPost].
extension UserPostPatterns on UserPost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPost value)  $default,){
final _that = this;
switch (_that) {
case _UserPost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPost value)?  $default,){
final _that = this;
switch (_that) {
case _UserPost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPost() when $default != null:
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title)  $default,) {final _that = this;
switch (_that) {
case _UserPost():
return $default(_that.id,_that.title);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title)?  $default,) {final _that = this;
switch (_that) {
case _UserPost() when $default != null:
return $default(_that.id,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPost with DiagnosticableTreeMixin implements UserPost {
  const _UserPost({this.id, this.title});
  factory _UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);

@override final  int? id;
@override final  String? title;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPostCopyWith<_UserPost> get copyWith => __$UserPostCopyWithImpl<_UserPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPostToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserPost'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPost&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserPost(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$UserPostCopyWith<$Res> implements $UserPostCopyWith<$Res> {
  factory _$UserPostCopyWith(_UserPost value, $Res Function(_UserPost) _then) = __$UserPostCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title
});




}
/// @nodoc
class __$UserPostCopyWithImpl<$Res>
    implements _$UserPostCopyWith<$Res> {
  __$UserPostCopyWithImpl(this._self, this._then);

  final _UserPost _self;
  final $Res Function(_UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,}) {
  return _then(_UserPost(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserComment implements DiagnosticableTreeMixin {

 int? get id; String? get body; int? get postId;
/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCommentCopyWith<UserComment> get copyWith => _$UserCommentCopyWithImpl<UserComment>(this as UserComment, _$identity);

  /// Serializes this UserComment to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserComment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('body', body))..add(DiagnosticsProperty('postId', postId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserComment&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,postId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserComment(id: $id, body: $body, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $UserCommentCopyWith<$Res>  {
  factory $UserCommentCopyWith(UserComment value, $Res Function(UserComment) _then) = _$UserCommentCopyWithImpl;
@useResult
$Res call({
 int? id, String? body, int? postId
});




}
/// @nodoc
class _$UserCommentCopyWithImpl<$Res>
    implements $UserCommentCopyWith<$Res> {
  _$UserCommentCopyWithImpl(this._self, this._then);

  final UserComment _self;
  final $Res Function(UserComment) _then;

/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? body = freezed,Object? postId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserComment].
extension UserCommentPatterns on UserComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserComment value)  $default,){
final _that = this;
switch (_that) {
case _UserComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserComment value)?  $default,){
final _that = this;
switch (_that) {
case _UserComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? body,  int? postId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserComment() when $default != null:
return $default(_that.id,_that.body,_that.postId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? body,  int? postId)  $default,) {final _that = this;
switch (_that) {
case _UserComment():
return $default(_that.id,_that.body,_that.postId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? body,  int? postId)?  $default,) {final _that = this;
switch (_that) {
case _UserComment() when $default != null:
return $default(_that.id,_that.body,_that.postId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserComment with DiagnosticableTreeMixin implements UserComment {
  const _UserComment({this.id, this.body, this.postId});
  factory _UserComment.fromJson(Map<String, dynamic> json) => _$UserCommentFromJson(json);

@override final  int? id;
@override final  String? body;
@override final  int? postId;

/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCommentCopyWith<_UserComment> get copyWith => __$UserCommentCopyWithImpl<_UserComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCommentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserComment'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('body', body))..add(DiagnosticsProperty('postId', postId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserComment&&(identical(other.id, id) || other.id == id)&&(identical(other.body, body) || other.body == body)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,body,postId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserComment(id: $id, body: $body, postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$UserCommentCopyWith<$Res> implements $UserCommentCopyWith<$Res> {
  factory _$UserCommentCopyWith(_UserComment value, $Res Function(_UserComment) _then) = __$UserCommentCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? body, int? postId
});




}
/// @nodoc
class __$UserCommentCopyWithImpl<$Res>
    implements _$UserCommentCopyWith<$Res> {
  __$UserCommentCopyWithImpl(this._self, this._then);

  final _UserComment _self;
  final $Res Function(_UserComment) _then;

/// Create a copy of UserComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? body = freezed,Object? postId = freezed,}) {
  return _then(_UserComment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,postId: freezed == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$UserProfile implements DiagnosticableTreeMixin {

 String? get name;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserProfile'))
    ..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserProfile(name: $name)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String? name
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile with DiagnosticableTreeMixin implements UserProfile {
  const _UserProfile({this.name});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String? name;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserProfile'))
    ..add(DiagnosticsProperty('name', name));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserProfile(name: $name)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String? name
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,}) {
  return _then(_UserProfile(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
