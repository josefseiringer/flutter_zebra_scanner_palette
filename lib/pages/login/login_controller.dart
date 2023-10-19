import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../pages/palett/palett_view.dart';
import '../../constants.dart';
import '../../pages/login/login_model.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  final szLoginUser = ''.obs;
  final passwordController = TextEditingController().obs;
  final asyncLoginUsers = <LoginUser>[].obs;
  final bIsLoading = false.obs;

  @override
  void onReady() async {
    await _readUsers();
    super.onReady();
  }

  @override
  void onClose() {
    passwordController.close();
  }

  loginScanner() {
    if (szLoginUser.isNotEmpty && passwordController.value.text != '') {
      //search list for Login User
      var resultUser = asyncLoginUsers.firstWhereOrNull((item) =>
          item.szUserName == szLoginUser.value &&
          item.szPassword == passwordController.value.text);
      if (resultUser != null) {
        //save User in static Item
        kLoginUserData = resultUser;
        //Popup Snake Bar
        kDisplaySnackBarSavePallet(
            'Login successfully!\nLogin User : ${kLoginUserData.szUserName}\nLocation :${kLoginUserData.szLocation}');
        // go to PalettPage
        Get.offAllNamed(PalettPage.namedRoute);
      } else {
        kDisplaySnackBar('User not found!');
      }
    } else {
      kDisplaySnackBar('Check Input fields');
    }
    update();
  }

  Future<void> _readUsers() async {
    var linkUser = dotenv.env['API_GET_LINK_USER'];
    var getUserLink = Uri.parse(linkUser!);
    try {
      bIsLoading(true);
      var response = await http.get(getUserLink, headers: kHttpHeaderBasic);
      if (response.statusCode == 200) {
        //data successfully
        //Parse the JSON data
        final responseUsers = response.body;
        final Map<String, dynamic> jsonData = jsonDecode(responseUsers);
        //Convert the JSON data to a list of Dart objects
        final List<dynamic> mapData = jsonData['data']['users'];
        final List<LoginUser> asyncList =
            mapData.map((json) => LoginUser.fromMap(json)).toList();
        asyncLoginUsers.value = asyncList;
      } else {
        kDisplaySnackBar('Error Status is ${response.statusCode}');
      }
    } catch (e) {
      kDisplaySnackBar('Error while getting data in $e');
    } finally {
      bIsLoading(false);
    }
    update();
  }
}
