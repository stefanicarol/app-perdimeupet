import '../const/api_constants.dart';
import '../model/pet.model.dart';
import '../services/api_provider.dart';

class PetRepository {
  final ApiProvider? _provider;
  String url = ApiConstants.pets;
  String filter = ApiConstants.filterpets;
  String mypets = ApiConstants.mypets;

  PetRepository(this._provider);

  post(PetModel petModel) async {
    await _provider!.restClient!.post(petModel, url);
  }

  Future<List<PetModel>> fetch() async {
    var response = await _provider!.restClient!.get(url);
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }

  Future<List<PetModel>> fetchFilter(String status) async {
    var response = await _provider!.restClient!.get('$filter$status');
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }

  Future<List<PetModel>> fetchMyPets(String owner) async {
    var response = await _provider!.restClient!.get('$mypets$owner');
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }

  Future<List<PetModel>> deleteMyPets(String id) async {
    var response = await _provider!.restClient!.delete('$mypets$id');
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }

  Future<PetModel> update(PetModel petModel, String id) async {
    var response = await _provider!.restClient!.put(petModel, '$url/$id');
    return PetModel.fromJson(response["updatePet"]);
  }
}
