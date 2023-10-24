import 'package:get/get.dart';
import '../../pages/order/order_palett_view.dart';
import '../../constants.dart';
import '../../services/order_model.dart';
import '../scann/scann_view.dart';

class PalettController extends GetxController {
  static PalettController get to => Get.find<PalettController>();
  final currentOrderModel =
      OrderModel('?', '?', '?', '?', '?', '?', '?', '?').obs;

  @override
  void onInit() {
    currentOrderModel.value = kOrderPalettData;
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  openOrderView(PalettenStatus status) {
    currentOrderModel.value.currentOrderModel('?', status,
        kLoginUserData.szLocation, '?', 'lat,lon?', 'street?', 'P');
    kOrderPalettData = currentOrderModel.value;
    Get.toNamed(OrderPalettPage.namedRoute);
  }

  //go to Tracking Page
  goToTracking(PalettenStatus status) {
    
    currentOrderModel.value.currentOrderModel('?', status,
        kLoginUserData.szLocation, '?', '?', '?', 'T');
    kOrderPalettData = currentOrderModel.value;
    Get.toNamed(ScannPage.namedRoute);
  }
}
