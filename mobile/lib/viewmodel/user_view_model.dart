import 'package:archi_mvvm_app/model/apis/api_response.dart';
import 'package:flutter/cupertino.dart';

import '../model/user.dart';
import '../model/user_repository.dart';

class UserViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  User? _user;

  ApiResponse get response {
    return _apiResponse;
  }

  User? get user {
    return _user;
  }

  /// an artist.
  Future<void> fetchUserData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching user data');
    notifyListeners();
    try {
      List<User> userList = await UserRepository().fetchUserList(value);
      print(userList);
      _apiResponse = ApiResponse.completed(userList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  /// an artist.
  Future<void> loginUser(String email, String Password) async {
    _apiResponse = ApiResponse.loading('Fetching user data');
    notifyListeners();
    try {
      User? userList = await UserRepository().fetchUser(email, Password);
      print(userList);
      _apiResponse = ApiResponse.completed(userList);
      setSelectedUser(userList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }

    notifyListeners();
  }

  void setSelectedUser(User? user) {
    _user = user;
    notifyListeners();
  }
}
