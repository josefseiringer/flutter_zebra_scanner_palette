import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find<LoginController>();
  final count = 0.obs;


  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;
}
