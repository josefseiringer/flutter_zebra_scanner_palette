import 'dart:convert';

import 'package:flutter/services.dart';

import '../pages/login/login_model.dart';

class MockService {
  static final _loginUser = <LoginUser>[];

  static Future<List<LoginUser>> get getMockUserList async {
    var users = await readUsers();
    return users;
  }

  static Future<List<LoginUser>> readUsers() async {
    //Load the JSON file
    final String jsonString = await rootBundle.loadString('lib/mock/user.json');
    //Parse the JSON data
    final List<dynamic> jsonData = jsonDecode(jsonString);
    //Convert the JSON data to a list of Dart objects
    final List<LoginUser> users =
        jsonData.map((json) => LoginUser.fromMap(json)).toList();
    return users;
  }

  static void setMockUserList(String user, String password) {
    var newLoginUser = LoginUser(szUserName: user, szPassword: password);
    _loginUser.add(newLoginUser);
  }
}
