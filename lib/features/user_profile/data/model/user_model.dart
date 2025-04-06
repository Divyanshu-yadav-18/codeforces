import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String handle;
  final String? email;
  final String? vkId;
  final String? openId;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? city;
  final String? organization;
  final int? contribution;
  final String? rank;
  final int? rating;
  final String? maxRank;
  final int? maxRating;
  final int? lastOnlineTimeSeconds;
  final int? registrationTimeSeconds;
  final int? friendOfCount;
  final String? avatar;
  final String? titlePhoto;

  UserModel({
    required this.handle,
    this.email,
    this.vkId,
    this.openId,
    this.firstName,
    this.lastName,
    this.country,
    this.city,
    this.organization,
    this.contribution,
    this.rank,
    this.rating,
    this.maxRank,
    this.maxRating,
    this.lastOnlineTimeSeconds,
    this.registrationTimeSeconds,
    this.friendOfCount,
    this.avatar,
    this.titlePhoto,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
