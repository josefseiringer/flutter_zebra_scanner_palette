import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../pages/palett/palett_view.dart';
import '../../constants.dart';
import '../../mock/mockservice.dart';
import '../../pages/login/login_model.dart';

class LoginController extends GetxController {
  final szLoginUser = ''.obs;
  final passwordController = TextEditingController().obs;
  late List<LoginUser> _mockLoginUsers;

  @override
  void onReady() async {
    _mockLoginUsers = await MockService.getMockUserList;
  }

  @override
  void onClose() {
    passwordController.close();
  }

  loginScanner() {
    if (szLoginUser.isNotEmpty && passwordController.value.text != '') {
      var resultUser = _mockLoginUsers.firstWhereOrNull((item) =>
          item.szUserName == szLoginUser.value &&
          item.szPassword == passwordController.value.text);
      if (resultUser != null) {
        kDisplaySnackBarSavePallet('Login successfully!');
        Get.offAllNamed(PalettPage.namedRoute);
      } else {
        kDisplaySnackBar('User not found!');
      }
    } else {
      kDisplaySnackBar('Check Input fields');
    }
  }
}
