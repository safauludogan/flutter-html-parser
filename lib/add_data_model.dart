class AddDataModel {
  String? targetMuscle;
  String? exerciseType;
  String? equipmentRequired;
  String? mechanics;
  String? forceType;
  String? experienceLevel;
  List<SecondaryMuscles>? secondaryMuscles;

  AddDataModel(
      {this.targetMuscle,
        this.exerciseType,
        this.equipmentRequired,
        this.mechanics,
        this.forceType,
        this.experienceLevel,
        this.secondaryMuscles});

  AddDataModel.fromJson(Map<String, dynamic> json) {
    targetMuscle = json['targetMuscle'];
    exerciseType = json['exerciseType'];
    equipmentRequired = json['equipmentRequired'];
    mechanics = json['mechanics'];
    forceType = json['forceType'];
    experienceLevel = json['experienceLevel'];
    if (json['secondaryMuscles'] != null) {
      secondaryMuscles = <SecondaryMuscles>[];
      json['secondaryMuscles'].forEach((v) {
        secondaryMuscles!.add(SecondaryMuscles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['targetMuscle'] = targetMuscle;
    data['exerciseType'] = exerciseType;
    data['equipmentRequired'] = equipmentRequired;
    data['mechanics'] = mechanics;
    data['forceType'] = forceType;
    data['experienceLevel'] = experienceLevel;
    if (secondaryMuscles != null) {
      data['secondaryMuscles'] =
          secondaryMuscles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SecondaryMuscles {
  String? elements;

  SecondaryMuscles({this.elements});

  SecondaryMuscles.fromJson(Map<String, dynamic> json) {
    elements = json['elements'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['elements'] = elements;
    return data;
  }
}
