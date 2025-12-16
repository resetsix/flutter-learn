// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRes _$UserResFromJson(Map<String, dynamic> json) => _UserRes(
  posts: (json['posts'] as List<dynamic>?)
      ?.map((e) => UserPost.fromJson(e as Map<String, dynamic>))
      .toList(),
  comments: (json['comments'] as List<dynamic>?)
      ?.map((e) => UserComment.fromJson(e as Map<String, dynamic>))
      .toList(),
  profile: json['profile'] == null
      ? null
      : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserResToJson(_UserRes instance) => <String, dynamic>{
  'posts': instance.posts,
  'comments': instance.comments,
  'profile': instance.profile,
};

_UserPost _$UserPostFromJson(Map<String, dynamic> json) => _UserPost(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
);

Map<String, dynamic> _$UserPostToJson(_UserPost instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
};

_UserComment _$UserCommentFromJson(Map<String, dynamic> json) => _UserComment(
  id: (json['id'] as num?)?.toInt(),
  body: json['body'] as String?,
  postId: (json['postId'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserCommentToJson(_UserComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'postId': instance.postId,
    };

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) =>
    _UserProfile(name: json['name'] as String?);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{'name': instance.name};
