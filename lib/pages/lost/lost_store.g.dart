// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lost_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LostStore on _LostStoreBase, Store {
  late final _$responseAtom =
      Atom(name: '_LostStoreBase.response', context: context);

  @override
  AppResponse<List<PetModel>> get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(AppResponse<List<PetModel>> value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  late final _$petListAtom =
      Atom(name: '_LostStoreBase.petList', context: context);

  @override
  List<PetModel>? get petList {
    _$petListAtom.reportRead();
    return super.petList;
  }

  @override
  set petList(List<PetModel>? value) {
    _$petListAtom.reportWrite(value, super.petList, () {
      super.petList = value;
    });
  }

  late final _$fecthAsyncAction =
      AsyncAction('_LostStoreBase.fecth', context: context);

  @override
  Future<List<PetModel>> fecth() {
    return _$fecthAsyncAction.run(() => super.fecth());
  }

  @override
  String toString() {
    return '''
response: ${response},
petList: ${petList}
    ''';
  }
}
