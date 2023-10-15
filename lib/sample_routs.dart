
import 'package:get/get.dart';
import '../pages/scann/scann_view.dart';
import '../pages/login/login_view.dart';

class SampleRouts {
  static final samplePages = [
    GetPage(
      name: LoginPage.namedRoute,
      page: () => const LoginPage(),
    ), 
    GetPage(
      name: ScannPage.namedRoute,
      page: () => const ScannPage(),
    ),   
  ];
}

