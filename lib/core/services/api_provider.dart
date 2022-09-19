import '../env/env.dart';
import 'rest_client.dart';

class ApiProvider {
  RestClient? restClient;
  String baseUrl = Env.baseUrl;
  ApiProvider() {
    restClient = RestClient(baseUrl);
  }
}
