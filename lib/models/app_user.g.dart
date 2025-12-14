// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
  uid: json['uid'] as String,
  email: json['email'] as String,
  name: json['name'] as String?,
  profilePicUrl: json['profile_pic_url'] as String?,
  userType:
      (json['user_type'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  ageOfLearners:
      (json['age_of_learners'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'name': instance.name,
  'profile_pic_url': instance.profilePicUrl,
  'user_type': instance.userType,
  'age_of_learners': instance.ageOfLearners,
};
