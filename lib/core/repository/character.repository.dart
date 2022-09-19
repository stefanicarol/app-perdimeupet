import 'package:perdimeupet/core/model/character.model.dart';
import '../const/api_constants.dart';
import '../services/api_provider.dart';

class CharacterRepository {
  final ApiProvider? _provider;
  CharacterRepository(this._provider);

  Future<List<CharacterModel>> fetch() async {
    var response = await _provider!.restClient!.get(ApiConstants.character);
    return response
        .map<CharacterModel>((json) => CharacterModel.fromJson(json))
        .toList();
  }
}
