import 'package:get/get.dart';
import '../../pages/order/order_palett_view.dart';
import '../../constants.dart';
import '../../services/order_model.dart';

class PalettController extends GetxController {
  static PalettController get to => Get.find<PalettController>();
  final currentOrderModel =
      OrderModel('?', '?', '?', '?', '?', '?', '?', '?').obs;
  final szPallScanCode = '?'.obs;

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
}
