import 'package:perdimeupet/core/model/cluster.model.dart';
import '../const/api_constants.dart';
import '../model/match.model.dart';
import '../services/api_provider.dart';

class MatchRepository {
  final ApiProvider? _provider;
  MatchRepository(this._provider);

  Future<List<ClusterMaster>> fetch(MatchModel match) async {
    var response =
        await _provider!.restClient!.post(match, ApiConstants.grouppets);
    return response
        .map<ClusterMaster>((json) => ClusterMaster.fromJson(json))
        .toList();
  }
}
