import 'package:get/get.dart';
import '../../pages/order/order_palett_view.dart';
import '../../constants.dart';
import '../../services/order_model.dart';

class PalettController extends GetxController {
  static PalettController get to => Get.find<PalettController>();
  final currentOrderModel =
      OrderModel('?', '?', '?', '?', '?', '?', '?', '?').obs;
  final szPallScanCode = '?'.obs;
  final mnVollEin = 10.0.obs;
  final mnVollAus = 10.0.obs;
  final mnLeerEin = 10.0.obs;
  final mnLeerAus = 10.0.obs;
  final mnPallUm = 10.0.obs;
  final bVollEin = false.obs;
  final bVollAus = false.obs;
  final bLeerEin = false.obs;
  final bLeerAus = false.obs;
  final bPallUm = false.obs;

  @override
  void onInit() {
    currentOrderModel.value = kOrderPalettData;
    expandingSizeBox();
    super.onInit();
  }

  void expandingSizeBox() {
    if (szPallScanCode.isNotEmpty) {
      if (bVollEin.value) {
        mnVollEin.value *= 5;
      } else {
        mnVollEin.value = 10.0;
      }
      if (bVollAus.value) {
        mnVollAus.value *= 5;
      } else {
        mnVollAus.value = 10.0;
      }
      if (bLeerEin.value) {
        mnLeerEin.value *= 5;
      } else {
        mnLeerEin.value = 10.0;
      }
      if (bLeerAus.value) {
        mnLeerAus.value *= 5;
      } else {
        mnLeerAus.value = 10.0;
      }
      if (bPallUm.value) {
        mnPallUm.value *= 5;
      } else {
        mnPallUm.value = 10.0;
      }
    }
    update();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  openOrderView(PalettenStatus status) {
    currentOrderModel.value.currentOrderModel('?', status,
        kLoginUserData.szLocation, '?', 'lat,lon?', 'street?', 'P');
    kOrderPalettData = currentOrderModel.value;
    Get.offAllNamed(OrderPalettPage.namedRoute);
  }
}
