// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterStore on _RegisterStoreBase, Store {
  late final _$fecthResponseAtom =
      Atom(name: '_RegisterStoreBase.fecthResponse', context: context);

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

  late final _$appResponseAtom =
      Atom(name: '_RegisterStoreBase.appResponse', context: context);

  @override
  AppResponse<PetModel> get appResponse {
    _$appResponseAtom.reportRead();
    return super.appResponse;
  }

  @override
  set appResponse(AppResponse<PetModel> value) {
    _$appResponseAtom.reportWrite(value, super.appResponse, () {
      super.appResponse = value;
    });
  }

  late final _$classificationAtom =
      Atom(name: '_RegisterStoreBase.classification', context: context);

  @override
  SingingCharacter? get classification {
    _$classificationAtom.reportRead();
    return super.classification;
  }

  @override
  set classification(SingingCharacter? value) {
    _$classificationAtom.reportWrite(value, super.classification, () {
      super.classification = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_RegisterStoreBase.status', context: context);

  @override
  SingingCharacter? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(SingingCharacter? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$isPublishedAtom =
      Atom(name: '_RegisterStoreBase.isPublished', context: context);

  @override
  bool get isPublished {
    _$isPublishedAtom.reportRead();
    return super.isPublished;
  }

  @override
  set isPublished(bool value) {
    _$isPublishedAtom.reportWrite(value, super.isPublished, () {
      super.isPublished = value;
    });
  }

  late final _$imagemAtom =
      Atom(name: '_RegisterStoreBase.imagem', context: context);

  @override
  String? get imagem {
    _$imagemAtom.reportRead();
    return super.imagem;
  }

  @override
  set imagem(String? value) {
    _$imagemAtom.reportWrite(value, super.imagem, () {
      super.imagem = value;
    });
  }

  late final _$speciesAtom =
      Atom(name: '_RegisterStoreBase.species', context: context);

  @override
  int get species {
    _$speciesAtom.reportRead();
    return super.species;
  }

  @override
  set species(int value) {
    _$speciesAtom.reportWrite(value, super.species, () {
      super.species = value;
    });
  }

  late final _$petStatusAtom =
      Atom(name: '_RegisterStoreBase.petStatus', context: context);

  @override
  int get petStatus {
    _$petStatusAtom.reportRead();
    return super.petStatus;
  }

  @override
  set petStatus(int value) {
    _$petStatusAtom.reportWrite(value, super.petStatus, () {
      super.petStatus = value;
    });
  }

  late final _$idListAtom =
      Atom(name: '_RegisterStoreBase.idList', context: context);

  @override
  List<int> get idList {
    _$idListAtom.reportRead();
    return super.idList;
  }

  @override
  set idList(List<int> value) {
    _$idListAtom.reportWrite(value, super.idList, () {
      super.idList = value;
    });
  }

  late final _$characterListAtom =
      Atom(name: '_RegisterStoreBase.characterList', context: context);

  @override
  List<CharacterModel> get characterList {
    _$characterListAtom.reportRead();
    return super.characterList;
  }

  @override
  set characterList(List<CharacterModel> value) {
    _$characterListAtom.reportWrite(value, super.characterList, () {
      super.characterList = value;
    });
  }

  late final _$petsAtom =
      Atom(name: '_RegisterStoreBase.pets', context: context);

  @override
  List<PetModel> get pets {
    _$petsAtom.reportRead();
    return super.pets;
  }

  @override
  set pets(List<PetModel> value) {
    _$petsAtom.reportWrite(value, super.pets, () {
      super.pets = value;
    });
  }

  late final _$fecthAsyncAction =
      AsyncAction('_RegisterStoreBase.fecth', context: context);

  @override
  Future<List<CharacterModel>> fecth() {
    return _$fecthAsyncAction.run(() => super.fecth());
  }

  late final _$fecthPetAsyncAction =
      AsyncAction('_RegisterStoreBase.fecthPet', context: context);

  @override
  Future fecthPet() {
    return _$fecthPetAsyncAction.run(() => super.fecthPet());
  }

  late final _$postAsyncAction =
      AsyncAction('_RegisterStoreBase.post', context: context);

  @override
  Future<void> post() {
    return _$postAsyncAction.run(() => super.post());
  }

  late final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase', context: context);

  @override
  dynamic setElements({required int i, required int index}) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setElements');
    try {
      return super.setElements(i: i, index: index);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSpecies(int i) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setSpecies');
    try {
      return super.setSpecies(i);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStatus(int i) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setStatus');
    try {
      return super.setStatus(i);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fecthResponse: ${fecthResponse},
appResponse: ${appResponse},
classification: ${classification},
status: ${status},
isPublished: ${isPublished},
imagem: ${imagem},
species: ${species},
petStatus: ${petStatus},
idList: ${idList},
characterList: ${characterList},
pets: ${pets}
    ''';
  }
}
