import 'dart:io';

import 'package:mvvm/users_list/models/users_list_model.dart';
import 'package:mvvm/users_list/repo/api_status.dart';
import 'package:mvvm/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USERS_LIST));
      if (SUCCESS == response.statusCode) {
        return Success(response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: "Invalid Respone");
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: "No Internet Connection");
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: "No Internet Connection");
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: "Invalid Format");
    } catch (e) {
      return Failure(code: UNKOWN_ERROR, errorResponse: "Unkown Error");
    }
  }
}
