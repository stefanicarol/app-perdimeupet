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
  Species? species;

  @observable
  int petStatus = 2;

  @observable
  List<CatBreed>? catBreedList;
  @observable
  List<ColorPet>? colorList;
  @observable
  List<Gender>? genderList;
  @observable
  List<Pelage>? pelageList;
  @observable
  List<SizePet>? sizeList;
  @observable
  List<Species>? speciesList;

  @observable
  List<CharacterModel> character = [];

  @observable
  List<PetModel> pets = [];

  @action
  setSpecies(Species i) => species = i;

  @action
  setStatus(int i) => petStatus = i;

  @observable
  CatBreed? catBreed;

  @observable
  ColorPet? color;

  @observable
  Gender? gender;

  @observable
  Pelage? pelage;

  @observable
  SizePet? size;

  @observable
  Species? speciesPet;

  @observable
  int? statusPet;

  @observable
  String? numberPhone;

  @observable
  String? observation;

  @observable
  String? city;

  @observable
  String? date;

  @action
  Future<List<CharacterModel>> fecth() async {
    fecthResponse = AppResponse.loading(message: "logando");
    character = await _repository.fetch();

    for (var element in character) {
      catBreedList = element.catBreed!;
      colorList = element.color!;
      genderList = element.gender;
      pelageList = element.pelage!;
      sizeList = element.size!;
      speciesList = element.species!;
    }
    fecthResponse = AppResponse.completed(character, message: "logando");
    return character;
  }

  @action
  fecthPet() async {
    pets = await _repo.fetch();
  }

  @action
  Future<void> post() async {
    PetModel pet = PetModel(
        id: pets.length,
        catBreed: catBreed,
        color: color!,
        gender: gender!,
        owner: _auth.currentUser!.email!,
        pelage: pelage!,
        photo: imagem!,
        size: size!,
        species: species!,
        status: petStatus,
        date: date,
        city: city,
        contact: numberPhone,
        observation: observation);
    appResponse = AppResponse.loading(message: "logando");
    await _repo.post(pet);
    appResponse = AppResponse.completed(pet, message: "complete");
    imagem = null;
  }
}
