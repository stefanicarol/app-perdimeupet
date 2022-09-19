import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import '../env/env.dart';
import '../exception/app_exception.dart';
import 'app_provider_error.dart';
import 'package:http/http.dart' as http;

typedef ClientRequest<S> = S Function();

class RestClient with ProviderError {
  final _dioClient = Dio();
  static var httpClient = http.Client();

  RestClient(String baseUrl) {
    _dioClient.options.baseUrl = Env.baseUrl;
    _dioClient.options.connectTimeout = 50000;
  }

  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      void Function(int, int)? onReceiveProgress}) async {
    try {
      verifyInternetConnection();
      dynamic response = await _dioClient.get(path,
          queryParameters: queryParameters,
          options: options,
          onReceiveProgress: onReceiveProgress);
      return analiseResponse(response);
    } on DioError catch (error) {
      return analiseResponse(error);
    } catch (error, stacktrace) {
      analiseHttpError(error, stacktrace);
    }
  }

  Future<dynamic> post(body, String url) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw InternetConnectionException();
    } else {
      final response =
          await http.post(Uri.parse(Env.envConfig!['base_url'] + url),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(body));
      if (response.statusCode != 200) {
        throw returnResponse(response.statusCode, response.body);
      } else {
        return jsonDecode(utf8.decode(response.bodyBytes));
      }
    }
  }
}
