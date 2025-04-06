// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  handle: json['handle'] as String,
  email: json['email'] as String?,
  vkId: json['vkId'] as String?,
  openId: json['openId'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  country: json['country'] as String?,
  city: json['city'] as String?,
  organization: json['organization'] as String?,
  contribution: (json['contribution'] as num?)?.toInt(),
  rank: json['rank'] as String?,
  rating: (json['rating'] as num?)?.toInt(),
  maxRank: json['maxRank'] as String?,
  maxRating: (json['maxRating'] as num?)?.toInt(),
  lastOnlineTimeSeconds: (json['lastOnlineTimeSeconds'] as num?)?.toInt(),
  registrationTimeSeconds: (json['registrationTimeSeconds'] as num?)?.toInt(),
  friendOfCount: (json['friendOfCount'] as num?)?.toInt(),
  avatar: json['avatar'] as String?,
  titlePhoto: json['titlePhoto'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'handle': instance.handle,
  'email': instance.email,
  'vkId': instance.vkId,
  'openId': instance.openId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'country': instance.country,
  'city': instance.city,
  'organization': instance.organization,
  'contribution': instance.contribution,
  'rank': instance.rank,
  'rating': instance.rating,
  'maxRank': instance.maxRank,
  'maxRating': instance.maxRating,
  'lastOnlineTimeSeconds': instance.lastOnlineTimeSeconds,
  'registrationTimeSeconds': instance.registrationTimeSeconds,
  'friendOfCount': instance.friendOfCount,
  'avatar': instance.avatar,
  'titlePhoto': instance.titlePhoto,
};
