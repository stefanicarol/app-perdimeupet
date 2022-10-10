import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import '../../core/app_response/app_response.model.dart';
import '../../core/model/character.model.dart';
import '../../core/repository/character.repository.dart';
import '../../core/repository/pet.repository.dart';

part 'lost_store.g.dart';

class LostStore = _LostStoreBase with _$LostStore;

abstract class _LostStoreBase with Store {
  final _repo = Modular.get<PetRepository>();

  @observable
  AppResponse<List<PetModel>> response = AppResponse();

  @observable
  List<CharacterModel>? character;

  @observable
  List<PetModel>? petList;

  @observable
  List<CatBreed>? petReturn;

  @action
  Future<List<PetModel>> fecthLost() async {
    response = AppResponse.loading(message: "logando");
    petList = await _repo.fetchLost();
    response = AppResponse.completed(petList, message: "logando");
    return petList!;
  }

  @action
  void setFilteredPets(List<PetModel> pets) => petList!.addAll(pets);

  @action
  Future<List<PetModel>> fecthLostCat() async {
    response = AppResponse.loading(message: "logando");
    petList = await _repo.fetchLost();
    var tempList = <PetModel>[];

    for (var i = 0; i < petList!.length; i++) {
      if (petList![i].species.id == 1) {
        tempList.add(petList![i]);
      }
    }
    petList!.clear();
    setFilteredPets(tempList);
    response = AppResponse.completed(petList, message: "logando");
    return petList!;
  }

  @action
  Future<List<PetModel>> fecthLostDog() async {
    response = AppResponse.loading(message: "logando");
    petList = await _repo.fetchLost();
    var tempList = <PetModel>[];

    for (var i = 0; i < petList!.length; i++) {
      if (petList![i].species.id == 2) {
        tempList.add(petList![i]);
      }
    }
    petList!.clear();
    setFilteredPets(tempList);
    response = AppResponse.completed(petList, message: "logando");
    return tempList;
  }

  final _repository = Modular.get<CharacterRepository>();

  @observable
  AppResponse<List<CharacterModel>> fecthResponse = AppResponse();

  @action
  Future<List<CharacterModel>?> fecth() async {
    fecthResponse = AppResponse.loading(message: "logando");
    character = await _repository.fetch();
    fecthResponse = AppResponse.completed(character, message: "logando");
    return character;
  }
}
