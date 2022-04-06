import 'dart:convert';
import 'dart:io';
import 'package:archi_mvvm_app/model/apis/app_exception.dart';
import 'package:archi_mvvm_app/model/services/base-service.dart';
import 'package:http/http.dart' as http;

import 'package:meta/meta.dart';

class UserService extends BaseService {
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(EvaxBaseUrl));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future loginUser(String email, String pass) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(
          'https://testa.free.beeceptor.com/login?email=$email&pass=$pass'));
      if (response.statusCode == 200) {
        responseJson = response;
      } else {
        return null;
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
