import '../const/api_constants.dart';
import '../model/pet.model.dart';
import '../services/api_provider.dart';

class PetRepository {
  final ApiProvider? _provider;
  String url = ApiConstants.pets;
  String endFind = ApiConstants.petsfind;
  String endLost = ApiConstants.petslost;
  PetRepository(this._provider);

  post(PetModel petModel) async {
    await _provider!.restClient!.post(petModel, url);
  }

  Future<List<PetModel>> fetch() async {
    var response = await _provider!.restClient!.get(url);
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }

  Future<List<PetModel>> fetchFind() async {
    var response = await _provider!.restClient!.get(endFind);
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }

  Future<List<PetModel>> fetchLost() async {
    var response = await _provider!.restClient!.get(endLost);
    return response.map<PetModel>((json) => PetModel.fromJson(json)).toList();
  }
}
