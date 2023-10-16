import 'package:get/get.dart';

class PalettController extends GetxController {
  final szPallScanCode = 'PLM410510'.obs;
  final mnVollEin = 10.0.obs;
  final mnVollAus = 10.0.obs;
  final mnLeerEin = 10.0.obs;
  final mnLeerAus = 10.0.obs;
  final mnVollUm = 10.0.obs;
  final mnLeerUm = 10.0.obs;
  final bVollEin = true.obs;
  final bVollAus = false.obs;
  final bLeerEin = false.obs;
  final bLeerAus = false.obs;
  final bVollUm = false.obs;
  final bLeerUm = false.obs;

  @override
  void onInit() {
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
      if (bVollUm.value) {
        mnVollUm.value *= 5;
      } else {
        mnVollUm.value = 10.0;
      }
      if (bLeerUm.value) {
        mnLeerUm.value *= 5;
      } else {
        mnLeerUm.value = 10.0;
      }
    }
    update();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
