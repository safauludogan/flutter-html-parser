// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_data_to_database_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddDataToDatabaseViewModel on _AddDataToDatabaseViewModelBase, Store {
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

  late final _$getDataFromUrlAsyncAction = AsyncAction(
      '_AddDataToDatabaseViewModelBase.getDataFromUrl',
      context: context);

  @override
  Future getDataFromUrl(String link) {
    return _$getDataFromUrlAsyncAction.run(() => super.getDataFromUrl(link));
  }

  @override
  String toString() {
    return '''
bodyBuildingModel: ${bodyBuildingModel}
    ''';
  }
}
