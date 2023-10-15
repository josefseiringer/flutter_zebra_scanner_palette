
import 'package:get/get.dart';
import '../pages/login/login_view.dart';
import '../sample_bindings.dart';
import '../pages/scann/scann_view.dart';

class SampleRouts {
  static List<GetPage<dynamic>> samplePages = [
    GetPage(
      name: LoginPage.namedRoute,
      page: () => const LoginPage(),
      binding: SampleBindings(),
    ),
    GetPage(
      name: ScannPage.namedRoute,
      page: () => const ScannPage(),
      binding: SampleBindings(),
    ),
   
  ];
}

