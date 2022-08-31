import 'package:json_annotation/json_annotation.dart';

part 'body_building_model.g.dart';

@JsonSerializable()
class BodyBuildingModel {
  String? exerciseName;
  String? targetMuscleGroup;
  String? exerciseType;
  String? equipmentRequired;
  String? mechanics;
  String? forceType;
  String? experienceLevel;
  SecondaryMuscles? secondaryMuscles;
  String? muscleAnatomyImage;

  BodyBuildingModel(
      {this.exerciseName,
      this.targetMuscleGroup,
      this.exerciseType,
      this.equipmentRequired,
      this.mechanics,
      this.forceType,
      this.experienceLevel,
      this.muscleAnatomyImage,
      this.secondaryMuscles});

  factory BodyBuildingModel.fromJson(Map<String, dynamic> json) {
    return _$BodyBuildingModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BodyBuildingModelToJson(this);
  }

  @override
  String toString() {
    return 'Exercise Name : $exerciseName\n Target Muscle Group : $targetMuscleGroup\n Exercise Type : $exerciseType\n Equipment Required : $equipmentRequired\n Mechanics : $mechanics\n Force Type : $forceType\n Experience Level : $experienceLevel\n Secondary Muscles : ${secondaryMuscles.toString()}\n Muscle Anatomy Image : $muscleAnatomyImage\n';
  }
}

@JsonSerializable()
class SecondaryMuscles {
  String? element;

  SecondaryMuscles({this.element});

  factory SecondaryMuscles.fromJson(Map<String, dynamic> json) {
    return _$SecondaryMusclesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SecondaryMusclesToJson(this);
  }

  @override
  String toString() {
    return '$element';
  }
}
