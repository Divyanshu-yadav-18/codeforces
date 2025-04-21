import 'package:json_annotation/json_annotation.dart';

part 'contest_model.g.dart';

@JsonSerializable()
class ContestModel {
  final int contestId;
  final String contestName;
  final int rank;
  final int oldRating;
  final int newRating;
  final int ratingUpdateTimeSeconds;

  ContestModel({
    required this.contestId,
    required this.contestName,
    required this.rank,
    required this.oldRating,
    required this.newRating,
    required this.ratingUpdateTimeSeconds,
  });

  factory ContestModel.fromJson(Map<String, dynamic> json) =>
      _$ContestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestModelToJson(this);
}
