import 'package:flutter_zebra_scanner_palette/pages/scann/scann_view.dart';
import 'package:get/get.dart';
import '../../services/current_location_controller.dart';
import '../../pages/palett/palett_controller.dart';
import '../../services/order_model.dart';

class OrderPalettController extends GetxController {
  static OrderPalettController get to => Get.find<OrderPalettController>();
  var pallCtrl = PalettController.to;
  var conCtrl = CurrentLocationController.to;
  var currOrderModel = OrderModel('?', '?', '?', '?', '?', '?', '?').obs;
  final hasInternet = false.obs;
  final hasGpsIsActive = false.obs;
  final hasGpsLocation = false.obs;
  final locationData = '???'.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    currOrderModel = pallCtrl.currentOrderModel;
    await getDataFromConCtrl().then(
      (bIsLoadingData) => isLoading(bIsLoadingData),
    );
    super.onInit();
  }

  @override
  void onClose() {
    conCtrl.onClose();
    pallCtrl.onClose();
  }

  Future<bool> getDataFromConCtrl() async {
    bool isLoading = true;
    await conCtrl
        .checkInternetConnection()
        .then((bool iCheckValue) => hasInternet(iCheckValue));
    if (hasInternet.isTrue) {
      await conCtrl
          .getLocation()
          .then((bool hasGPSLocVal) => hasGpsLocation(hasGPSLocVal));
      if (hasGpsLocation.isTrue) {
        locationData.value = conCtrl.locationData.value;
        currOrderModel.value.szGeoData =
            '${conCtrl.latitude.value.substring(0, 8)},${conCtrl.longitude.value.substring(0, 8)}';
        currOrderModel.value.szGeoString = conCtrl.rxGeoString.value;
        isLoading = false;
      }
    }
    update();
    return isLoading;
  }

  void goToScanPage() {
    Get.toNamed(ScannPage.namedRoute,
        arguments: {'currOrderModel': currOrderModel.value});
  }
}
