// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_pets_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyPetsStore on _MyPetsStoreBase, Store {
  late final _$responseAtom =
      Atom(name: '_MyPetsStoreBase.response', context: context);

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

  late final _$listPetsAtom =
      Atom(name: '_MyPetsStoreBase.listPets', context: context);

  @override
  List<PetModel> get listPets {
    _$listPetsAtom.reportRead();
    return super.listPets;
  }

  @override
  set listPets(List<PetModel> value) {
    _$listPetsAtom.reportWrite(value, super.listPets, () {
      super.listPets = value;
    });
  }

  late final _$fecthAsyncAction =
      AsyncAction('_MyPetsStoreBase.fecth', context: context);

  @override
  Future<List<PetModel>> fecth(String user) {
    return _$fecthAsyncAction.run(() => super.fecth(user));
  }

  @override
  String toString() {
    return '''
response: ${response},
listPets: ${listPets}
    ''';
  }
}
