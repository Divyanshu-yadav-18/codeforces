// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContestModel _$ContestModelFromJson(Map<String, dynamic> json) => ContestModel(
  contestId: (json['contestId'] as num).toInt(),
  contestName: json['contestName'] as String,
  rank: (json['rank'] as num).toInt(),
  oldRating: (json['oldRating'] as num).toInt(),
  newRating: (json['newRating'] as num).toInt(),
  ratingUpdateTimeSeconds: (json['ratingUpdateTimeSeconds'] as num).toInt(),
);

Map<String, dynamic> _$ContestModelToJson(ContestModel instance) =>
    <String, dynamic>{
      'contestId': instance.contestId,
      'contestName': instance.contestName,
      'rank': instance.rank,
      'oldRating': instance.oldRating,
      'newRating': instance.newRating,
      'ratingUpdateTimeSeconds': instance.ratingUpdateTimeSeconds,
    };
