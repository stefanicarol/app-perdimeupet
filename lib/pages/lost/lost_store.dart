import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:perdimeupet/core/model/pet.model.dart';
import '../../core/app_response/app_response.model.dart';
import '../../core/const/api_constants.dart';
import '../../core/repository/pet.repository.dart';

part 'lost_store.g.dart';

class LostStore = _LostStoreBase with _$LostStore;

abstract class _LostStoreBase with Store {
  final _repo = Modular.get<PetRepository>();
  String lost = ApiConstants.lost;

  @observable
  AppResponse<List<PetModel>> response = AppResponse();

  @observable
  PetModel? pet;

  @observable
  List<PetModel>? listPets;

  @action
  Future<List<PetModel>> fecth() async {
    response = AppResponse.loading(message: "logando");
    listPets = await _repo.fetchFilter(lost);
    response = AppResponse.completed(listPets, message: "logando");
    return listPets!;
  }

  @action
  void setFilteredPets(List<PetModel> pets) => listPets!.addAll(pets);

  @action
  Future<List<PetModel>> fetchFilter(String species, String status) async {
    response = AppResponse.loading(message: "logando");
    listPets = await _repo.fetchFilter(status);
    var tempList = <PetModel>[];

    for (var i = 0; i < listPets!.length; i++) {
      if (listPets![i].species == species) {
        tempList.add(listPets![i]);
      }
    }
    listPets!.clear();
    setFilteredPets(tempList);
    response = AppResponse.completed(listPets, message: "logando");
    return listPets!;
  }
}
