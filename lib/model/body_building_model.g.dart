// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_building_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyBuildingModel _$BodyBuildingModelFromJson(Map<String, dynamic> json) =>
    BodyBuildingModel(
      exerciseName: json['exerciseName'] as String?,
      targetMuscleGroup: json['targetMuscleGroup'] as String?,
      exerciseType: json['exerciseType'] as String?,
      equipmentRequired: json['equipmentRequired'] as String?,
      mechanics: json['mechanics'] as String?,
      forceType: json['forceType'] as String?,
      experienceLevel: json['experienceLevel'] as String?,
      muscleAnatomyImage: json['muscleAnatomyImage'] as String?,
      secondaryMuscles: json['secondaryMuscles'] == null
          ? null
          : SecondaryMuscles.fromJson(
              json['secondaryMuscles'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyBuildingModelToJson(BodyBuildingModel instance) =>
    <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'targetMuscleGroup': instance.targetMuscleGroup,
      'exerciseType': instance.exerciseType,
      'equipmentRequired': instance.equipmentRequired,
      'mechanics': instance.mechanics,
      'forceType': instance.forceType,
      'experienceLevel': instance.experienceLevel,
      'secondaryMuscles': instance.secondaryMuscles,
      'muscleAnatomyImage': instance.muscleAnatomyImage,
    };

SecondaryMuscles _$SecondaryMusclesFromJson(Map<String, dynamic> json) =>
    SecondaryMuscles(
      element: json['element'] as String?,
    );

Map<String, dynamic> _$SecondaryMusclesToJson(SecondaryMuscles instance) =>
    <String, dynamic>{
      'element': instance.element,
    };
