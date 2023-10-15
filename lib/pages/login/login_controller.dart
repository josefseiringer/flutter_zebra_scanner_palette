import 'package:flutter/material.dart';
import 'package:flutter_zebra_scanner_palette/pages/scann/scann_view.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../mock/mockservice.dart';
import '../../pages/login/login_model.dart';

class LoginController extends GetxController {
  final szLoginUser = ''.obs;
  final passwordController = TextEditingController().obs;
  late List<LoginUser> _mockLoginUsers;

  @override
  void onReady() {
    _mockLoginUsers = MockService.getMockUserList;
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
        Get.offAndToNamed(ScannPage.namedRoute);
      } else {
        kDisplaySnackBar('User not found!');
      }
    } else {
      kDisplaySnackBar('Check Input fields');
    }
  }
}
