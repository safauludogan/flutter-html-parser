// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InternetControl on _InternetControlBase, Store {
  late final _$networkConnectivityEnumsAtom = Atom(
      name: '_InternetControlBase.networkConnectivityEnums', context: context);

  @override
  NetworkConnectivityEnums? get networkConnectivityEnums {
    _$networkConnectivityEnumsAtom.reportRead();
    return super.networkConnectivityEnums;
  }

  @override
  set networkConnectivityEnums(NetworkConnectivityEnums? value) {
    _$networkConnectivityEnumsAtom
        .reportWrite(value, super.networkConnectivityEnums, () {
      super.networkConnectivityEnums = value;
    });
  }

  late final _$checkFirstTimeInternetConnectionAsyncAction = AsyncAction(
      '_InternetControlBase.checkFirstTimeInternetConnection',
      context: context);

  @override
  Future<void> checkFirstTimeInternetConnection() {
    return _$checkFirstTimeInternetConnectionAsyncAction
        .run(() => super.checkFirstTimeInternetConnection());
  }

  @override
  String toString() {
    return '''
networkConnectivityEnums: ${networkConnectivityEnums}
    ''';
  }
}
