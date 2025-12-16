import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserRes with _$UserRes {
  const factory UserRes({
    @Default([]) List<UserPost> posts,
    @Default([]) List<UserComment> comments,
    UserProfile? profile,
  }) = _UserRes;

  factory UserRes.fromJson(Map<String, Object?> json) =>
      _$UserResFromJson(json);
}

@freezed
abstract class UserPost with _$UserPost {
  const factory UserPost({int? id, String? title}) = _UserPost;

  factory UserPost.fromJson(Map<String, Object?> json) =>
      _$UserPostFromJson(json);
}

@freezed
abstract class UserComment with _$UserComment {
  const factory UserComment({int? id, String? body, int? postId}) =
      _UserComment;

  factory UserComment.fromJson(Map<String, Object?> json) =>
      _$UserCommentFromJson(json);
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({String? name}) = _UserProfile;

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);
}
