import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import '../../core/app_response/app_response.model.dart';
import '../../core/model/character.model.dart';
import '../../core/repository/character.repository.dart';
import '../../core/repository/pet.repository.dart';

part 'find_store.g.dart';

class FindStore = _FindStoreBase with _$FindStore;

abstract class _FindStoreBase with Store {
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
  Future<List<PetModel>> fetchFind() async {
    response = AppResponse.loading(message: "logando");
    petList = await _repo.fetchFind();
    response = AppResponse.completed(petList, message: "logando");
    return petList!;
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
