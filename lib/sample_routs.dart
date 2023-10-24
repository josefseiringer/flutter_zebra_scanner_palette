
import 'package:get/get.dart';
import '../pages/track/track_view.dart';
import '../pages/palett/palett_view.dart';
import '../pages/scann/scann_view.dart';
import '../pages/login/login_view.dart';
import '../pages/order/order_palett_view.dart';

class SampleRouts {
  static final samplePages = [
    GetPage(
      name: LoginPage.namedRoute,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: PalettPage.namedRoute,
      page: () => const PalettPage(),
    ),  
    GetPage(
      name: ScannPage.namedRoute,
      page: () => const ScannPage(),
    ),
    GetPage(
      name: OrderPalettPage.namedRoute,
      page: () => const OrderPalettPage(),
    ),
    GetPage(
      name: TrackPage.namedRoute,
      page: () => const TrackPage(),
    ),    
  ];
}

