import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import '../../core/app_response/app_response.model.dart';
import '../../core/model/character.model.dart';
import '../../core/repository/character.repository.dart';
import '../../core/repository/pet.repository.dart';
import 'widget/radio_list_tile.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final _repository = Modular.get<CharacterRepository>();
  final _repo = Modular.get<PetRepository>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @observable
  AppResponse<List<CharacterModel>> fecthResponse = AppResponse();

  @observable
  AppResponse<PetModel> appResponse = AppResponse();

  @observable
  SingingCharacter? classification = SingingCharacter.cachorro;

  @observable
  SingingCharacter? status = SingingCharacter.perdido;

  @observable
  bool isPublished = true;

  @observable
  String? imagem;

  @observable
  int species = 1;

  @observable
  int petStatus = 1;

  @observable
  var idList = [0, 0, 0, 0, 0];

  @observable
  List<CharacterModel> characterList = [];

  @observable
  List<PetModel> pets = [];

  @action
  setElements({required int i, required int index}) => idList[index] = i;

  @action
  setSpecies(int i) => species = i;

  @action
  setStatus(int i) => petStatus = i;

  @action
  Future<List<CharacterModel>> fecth() async {
    fecthResponse = AppResponse.loading(message: "logando");
    characterList = await _repository.fetch();
    fecthResponse = AppResponse.completed(characterList, message: "logando");
    return characterList;
  }

  @action
  fecthPet() async {
    pets = await _repo.fetch();
  }

  @action
  Future<void> post() async {
    PetModel pet = PetModel(
      id: pets.length,
      catBreed: idList[0],
      color: idList[1],
      gender: idList[2],
      owner: _auth.currentUser!.email!,
      pelage: idList[3],
      photo: imagem!,
      size: idList[4],
      species: species,
      status: petStatus,
    );
    appResponse = AppResponse.loading(message: "logando");
    await _repo.post(pet);
    appResponse = AppResponse.completed(pet, message: "complete");
  }
}
