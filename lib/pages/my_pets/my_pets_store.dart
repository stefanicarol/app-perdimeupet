import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import '../../core/app_response/app_response.model.dart';
import '../../core/repository/pet.repository.dart';

part 'my_pets_store.g.dart';

class MyPetsStore = _MyPetsStoreBase with _$MyPetsStore;

abstract class _MyPetsStoreBase with Store {
  final _repo = Modular.get<PetRepository>();

  @observable
  AppResponse<List<PetModel>> response = AppResponse();

  @observable
  List<PetModel> listPets = [];

  @action
  Future<List<PetModel>> fecth(String user) async {
    response = AppResponse.loading(message: "logando");
    listPets = await _repo.fetchMyPets(user);
    response = AppResponse.completed(listPets, message: "logando");
    return listPets;
  }

  Future<PetModel> update(PetModel pet, String id) async {
    response = AppResponse.loading(message: "logando");
    PetModel petModel = await _repo.update(pet, id);
    response = AppResponse.completed(listPets, message: "logando");
    return petModel;
  }
}
