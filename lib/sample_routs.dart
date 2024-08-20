
import 'package:flutter_zebra_scanner_palette/sample_bindings.dart';
import 'package:get/get.dart';
import '../pages/track/track_view.dart';
import '../pages/palett/palett_view.dart';
import '../pages/scann/scann_view.dart';
import '../pages/login/login_view.dart';
import '../pages/order/order_palett_view.dart';

class SampleRouts {
  static final sampleBindings = SampleBindings();
  static final samplePages = [
    GetPage(
      name: LoginPage.namedRoute,
      binding: sampleBindings,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: PalettPage.namedRoute,
      binding: sampleBindings,
      page: () => const PalettPage(),
    ),  
    GetPage(
      name: ScannPage.namedRoute,
      binding: sampleBindings,
      page: () => const ScannPage(),
    ),
    GetPage(
      name: OrderPalettPage.namedRoute,
      binding: sampleBindings,
      page: () => const OrderPalettPage(),
    ),
    GetPage(
      name: TrackPage.namedRoute,
      binding: sampleBindings,
      page: () => const TrackPage(),
    ),    
  ];
}


