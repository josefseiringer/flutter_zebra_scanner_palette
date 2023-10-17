import 'package:get/get.dart';

enum PalettenStatus {
  eingang, //1
  eingangLeer, //4
  ausgang, //3
  ausgangLeer, //5
  umlagerung, //2
}

class PalettController extends GetxController {
  final szPallScanCode = 'PLM410510'.obs;
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
  final palettenStatus = PalettenStatus.eingang;

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
}
