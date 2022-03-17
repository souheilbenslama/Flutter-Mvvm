import 'dart:convert';

import 'package:archi_mvvm_app/model/services/user-service.dart';
import 'package:archi_mvvm_app/model/user.dart';

class UserRepository {
  UserService _UserService = UserService();

  Future<List<User>> fetchUserList(String value) async {
    dynamic response = await _UserService.getResponse(value);

    final jsonData = response as List;
    List<User> userList =
        jsonData.map((tagJson) => User.fromJson(tagJson)).toList();
    return userList;
  }

  Future<User?> fetchUser(String email, String pass) async {
    dynamic response = await _UserService.loginUser(email, pass);
    print(response.body);
    if (response != null) {
      final jsonData = [json.decode(response.body)];
      List<User> userList =
          jsonData.map((tagJson) => User.fromJson(tagJson)).toList();
      return userList[0];
    } else {
      return null;
    }
  }
}
