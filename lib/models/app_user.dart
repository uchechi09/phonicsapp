

import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  final String uid;
  final String email;
  final String? name;

  @JsonKey(name: 'profile_pic_url')
  final String? profilePicUrl;

  @JsonKey(name: 'user_type')
  final List<String> userType;

  @JsonKey(name: 'age_of_learners')
  final List<String> ageOfLearners;

  AppUser({
   required this.uid,
    required this.email,
    this.name,
    this.profilePicUrl,
    this.userType = const [],
    this.ageOfLearners = const [],
  

  });
  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  AppUser copyWith({
    String? uid,
    String? email,
    String? name,
    String? profilePicUrl,
    List<String>? userType,
    List<String>? ageOfLearners,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      userType: userType ?? this.userType,
      ageOfLearners: ageOfLearners ?? this.ageOfLearners,
    );
  }
}
