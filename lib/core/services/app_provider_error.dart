import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../exception/app_exception.dart';

mixin ProviderError {
  verifyInternetConnection() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) throw InternetConnectionException();
  }

  dynamic analiseResponse(dynamic requestResponse) {
    if (requestResponse is DioError) {
      if (DioErrorType.receiveTimeout == requestResponse.type ||
          DioErrorType.connectTimeout == requestResponse.type) {
        throw FetchDataException(
            "O servidor não está acessível. Verifique sua conexão com a internet e tente novamente");
      } else if (DioErrorType.response == requestResponse.type) {
        return returnResponse(
            requestResponse.response!.statusCode!, requestResponse.response);
      } else if (DioErrorType.other == requestResponse.type) {
        if (requestResponse.message.contains('SocketException')) {
          throw FetchDataException(
              "O servidor não está acessível. Por favor, entre em contato com o suporte.");
        } else {
          throw FetchDataException(requestResponse.error);
        }
      } else {
        throw FetchDataException(
            "Problema ao conectar-se ao servidor. Por favor, tente novamente.");
      }
    } else if (requestResponse is Response) {
      return returnResponse(requestResponse.statusCode!, requestResponse.data);
    }
  }

  dynamic returnResponse(int code, dynamic body) {
    switch (code) {
      case 200:
      case 201:
        return body;
      case 400:
        throw BadRequestException(body);
      case 403:
        throw UnauthorizedException(
            "Você não possui autorização para realizar essa ação.");
      case 404:
        throw NotFoundException(
            "O servidor não está acessível. Entre em contato com o suporte.");
      case 500:
      default:
        throw FetchDataException(
            "Problema ao conectar-se ao servidor. Por favor, tente novamente.");
    }
  }

  analiseHttpError(dynamic exception, StackTrace stacktrace) {
    if (exception is SocketException) {
      throw InternetConnectionException(
          exception: exception, stacktrace: stacktrace);
    }
    throw FetchDataException(
        "Tivemos um problema ao conectar-se ao servidor. Por favor, tente novamente.",
        exception: exception,
        stacktrace: stacktrace);
  }
}
