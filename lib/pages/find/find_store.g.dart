// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FindStore on _FindStoreBase, Store {
  late final _$responseAtom =
      Atom(name: '_FindStoreBase.response', context: context);

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

  late final _$petAtom = Atom(name: '_FindStoreBase.pet', context: context);

  @override
  PetModel? get pet {
    _$petAtom.reportRead();
    return super.pet;
  }

  @override
  set pet(PetModel? value) {
    _$petAtom.reportWrite(value, super.pet, () {
      super.pet = value;
    });
  }

  late final _$listPetsAtom =
      Atom(name: '_FindStoreBase.listPets', context: context);

  @override
  List<PetModel>? get listPets {
    _$listPetsAtom.reportRead();
    return super.listPets;
  }

  @override
  set listPets(List<PetModel>? value) {
    _$listPetsAtom.reportWrite(value, super.listPets, () {
      super.listPets = value;
    });
  }

  late final _$fecthAsyncAction =
      AsyncAction('_FindStoreBase.fecth', context: context);

  @override
  Future<List<PetModel>> fecth() {
    return _$fecthAsyncAction.run(() => super.fecth());
  }

  late final _$fetchFilterAsyncAction =
      AsyncAction('_FindStoreBase.fetchFilter', context: context);

  @override
  Future<List<PetModel>> fetchFilter(String species, String status) {
    return _$fetchFilterAsyncAction
        .run(() => super.fetchFilter(species, status));
  }

  late final _$_FindStoreBaseActionController =
      ActionController(name: '_FindStoreBase', context: context);

  @override
  void setFilteredPets(List<PetModel> pets) {
    final _$actionInfo = _$_FindStoreBaseActionController.startAction(
        name: '_FindStoreBase.setFilteredPets');
    try {
      return super.setFilteredPets(pets);
    } finally {
      _$_FindStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
response: ${response},
pet: ${pet},
listPets: ${listPets}
    ''';
  }
}
