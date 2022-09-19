import 'package:connectivity_plus/connectivity_plus.dart';

import '../app_response/app_response.model.dart';
import './app_exception.dart';

mixin ControllerError {
  Future<AppResponse<T>> handlerError<T>(dynamic exception,
      {StackTrace? stacktrace, String? message}) async {
    if (exception is AppException) {
      return AppResponse.error(exception.toString());
    }

    return AppResponse.error(
        message ?? "Tivemos um problema ao realizar a ação...");
  }

  Future<bool> hasInternetConnection() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return ConnectivityResult.none != result;
  }
}
