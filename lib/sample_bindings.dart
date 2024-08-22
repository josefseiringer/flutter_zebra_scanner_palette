import 'package:get/get.dart';
import './pages/login/login_controller.dart';
import './pages/order/order_palett_controller.dart';
import './pages/palett/palett_controller.dart';
import './pages/track/track_controller.dart';
import './services/current_location_controller.dart';

class SampleBindings extends Bindings {
  @override
  void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<PalettController>(() => PalettController());
  Get.lazyPut<OrderPalettController>(() => OrderPalettController());
  Get.lazyPut<CurrentLocationController>(() => CurrentLocationController());
  Get.lazyPut<TrackController>(() => TrackController());
  }
}