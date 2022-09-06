// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data_to_database_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddDataToDatabaseViewModel on _AddDataToDatabaseViewModelBase, Store {
  late final _$futureAtom =
      Atom(name: '_AddDataToDatabaseViewModelBase.future', context: context);

  @override
  Future<List<BodyBuildingModel>>? get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<BodyBuildingModel>>? value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  late final _$isDataGettingAtom = Atom(
      name: '_AddDataToDatabaseViewModelBase.isDataGetting', context: context);

  @override
  bool get isDataGetting {
    _$isDataGettingAtom.reportRead();
    return super.isDataGetting;
  }

  @override
  set isDataGetting(bool value) {
    _$isDataGettingAtom.reportWrite(value, super.isDataGetting, () {
      super.isDataGetting = value;
    });
  }

  late final _$bodyBuildingModelAtom = Atom(
      name: '_AddDataToDatabaseViewModelBase.bodyBuildingModel',
      context: context);

  @override
  List<BodyBuildingModel> get bodyBuildingModel {
    _$bodyBuildingModelAtom.reportRead();
    return super.bodyBuildingModel;
  }

  @override
  set bodyBuildingModel(List<BodyBuildingModel> value) {
    _$bodyBuildingModelAtom.reportWrite(value, super.bodyBuildingModel, () {
      super.bodyBuildingModel = value;
    });
  }

  late final _$getAllExerciseLinksAsyncAction = AsyncAction(
      '_AddDataToDatabaseViewModelBase.getAllExerciseLinks',
      context: context);

  @override
  Future<List<BodyBuildingModel>> getAllExerciseLinks() {
    return _$getAllExerciseLinksAsyncAction
        .run(() => super.getAllExerciseLinks());
  }

  @override
  String toString() {
    return '''
future: ${future},
isDataGetting: ${isDataGetting},
bodyBuildingModel: ${bodyBuildingModel}
    ''';
  }
}
