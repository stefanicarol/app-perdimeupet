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

  late final _$characterAtom =
      Atom(name: '_LostStoreBase.character', context: context);

  @override
  List<CharacterModel>? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(List<CharacterModel>? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
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

  late final _$petReturnAtom =
      Atom(name: '_LostStoreBase.petReturn', context: context);

  @override
  List<CatBreed>? get petReturn {
    _$petReturnAtom.reportRead();
    return super.petReturn;
  }

  @override
  set petReturn(List<CatBreed>? value) {
    _$petReturnAtom.reportWrite(value, super.petReturn, () {
      super.petReturn = value;
    });
  }

  late final _$fecthResponseAtom =
      Atom(name: '_LostStoreBase.fecthResponse', context: context);

  @override
  AppResponse<List<CharacterModel>> get fecthResponse {
    _$fecthResponseAtom.reportRead();
    return super.fecthResponse;
  }

  @override
  set fecthResponse(AppResponse<List<CharacterModel>> value) {
    _$fecthResponseAtom.reportWrite(value, super.fecthResponse, () {
      super.fecthResponse = value;
    });
  }

  late final _$fecthLostAsyncAction =
      AsyncAction('_LostStoreBase.fecthLost', context: context);

  @override
  Future<List<PetModel>> fecthLost() {
    return _$fecthLostAsyncAction.run(() => super.fecthLost());
  }

  late final _$fecthLostCatAsyncAction =
      AsyncAction('_LostStoreBase.fecthLostCat', context: context);

  @override
  Future<List<PetModel>> fecthLostCat() {
    return _$fecthLostCatAsyncAction.run(() => super.fecthLostCat());
  }

  late final _$fecthLostDogAsyncAction =
      AsyncAction('_LostStoreBase.fecthLostDog', context: context);

  @override
  Future<List<PetModel>> fecthLostDog() {
    return _$fecthLostDogAsyncAction.run(() => super.fecthLostDog());
  }

  late final _$fecthAsyncAction =
      AsyncAction('_LostStoreBase.fecth', context: context);

  @override
  Future<List<CharacterModel>?> fecth() {
    return _$fecthAsyncAction.run(() => super.fecth());
  }

  late final _$_LostStoreBaseActionController =
      ActionController(name: '_LostStoreBase', context: context);

  @override
  void setFilteredPets(List<PetModel> pets) {
    final _$actionInfo = _$_LostStoreBaseActionController.startAction(
        name: '_LostStoreBase.setFilteredPets');
    try {
      return super.setFilteredPets(pets);
    } finally {
      _$_LostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
response: ${response},
character: ${character},
petList: ${petList},
petReturn: ${petReturn},
fecthResponse: ${fecthResponse}
    ''';
  }
}
