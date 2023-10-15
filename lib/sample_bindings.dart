import 'package:get/get.dart';
import '../pages/login/login_view.dart';
import '../pages/scann/scann_view.dart';

class SampleBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannPage>((() => const ScannPage()));
    Get.lazyPut<LoginPage>((() => const LoginPage()));
  }
}
