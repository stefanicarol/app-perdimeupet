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
  String species = SingingCharacter.cachorro.name;

  @observable
  String petStatus = "perdido";

  @observable
  List<CatBreed>? catBreedList;
  @observable
  List<DogBreed>? dogBreedList;
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
  setSpecies(String i) => species = i;

  @action
  setStatus(String i) => petStatus = i;

  @observable
  String? catBreed;

  @observable
  bool returned = false;

  @observable
  String? dogBreed;

  @observable
  String? color;

  @observable
  String? gender;

  @observable
  String? pelage;

  @observable
  String? size;

  @observable
  String? speciesPet;

  @observable
  int? statusPet;

  @observable
  String numberPhone = "(63) 9 9999-9999";

  @observable
  String? observation;

  @observable
  String city = "Palmas/TO";

  @observable
  String date = DateTime.now().toString();

  @observable
  PetModel? petModel;

  @action
  Future<List<CharacterModel>> fecth() async {
    fecthResponse = AppResponse.loading(message: "logando");
    character = await _repository.fetch();

    for (var element in character) {
      catBreedList = element.catBreed!;
      dogBreedList = element.dogBreed!;
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
        returned: returned,
        catBreed: catBreed,
        dogBreed: dogBreed,
        color: color!,
        gender: gender!,
        owner: _auth.currentUser!.email!,
        pelage: pelage!,
        photo: imagem!,
        size: size!,
        species: species,
        status: petStatus,
        date: date,
        city: city,
        contact: numberPhone,
        observation: observation);
    appResponse = AppResponse.loading(message: "logando");
    petModel = await _repo.post(pet);
    appResponse = AppResponse.completed(petModel, message: "complete");
    imagem = null;
  }
}
