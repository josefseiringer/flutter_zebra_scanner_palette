import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../../pages/palett/palett_view.dart';
import '../../pages/scann/scann_view.dart';
import '../../services/current_location_controller.dart';
import '../../services/order_model.dart';

class OrderPalettController extends GetxController {
  static OrderPalettController get to => Get.find<OrderPalettController>();
  var conCtrl = CurrentLocationController.to;
  var currOrderModel = OrderModel('?', '?', '?', '?', '?', '?', '?', '?').obs;
  final hasInternet = false.obs;
  final hasGpsIsActive = false.obs;
  final hasGpsLocation = false.obs;
  final locationData = '???'.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    currOrderModel.value = kOrderPalettData;
    await getDataFromConCtrl().then(
      (bIsLoadingData) => isLoading(bIsLoadingData),
    );
    super.onInit();
  }

  @override
  void onClose() {
    conCtrl.onClose();
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
    } else {
      // No Internet connection
      //kDisplaySnackBarBlue('Bitte mobile Daten aktivieren fals vorhanden!');
      locationData.value = kLoginUserData.szLocation;
      isLoading = false;
    }
    update();
    return isLoading;
  }

  //Goto pallet Page
  void exitToPage() {
    Get.offAllNamed(PalettPage.namedRoute);
  }

  //Open Scann Page
  void openScannPage() {
    Get.offAllNamed(ScannPage.namedRoute);
  }

  // Go to Scann Page
  void goToScanPagePalette() {
    currOrderModel.value.szScannPalletOrZone = 'P';
    kOrderPalettData = currOrderModel.value;
    openScannPage();
  }

  // Go to Scann Page
  void goToScanPageZone() {
    currOrderModel.value.szScannPalletOrZone = 'Z';
    kOrderPalettData = currOrderModel.value;
    openScannPage();
  }

  // Save Palettdata and Exit
  void saveAndExit() async {
    //save
    await savePalettOrderAsync();
    // goto prev page
    exitToPage();
  }

  Future<bool> savePalettOrderAsync() async {
    var client = http.Client();
    bool isSaving = false;
    var linkPalett = dotenv.env['API_PUT_LINK_PALETTE_TRACKING'];
    linkPalett = '$linkPalett${kOrderPalettData.szPaletteID}';
    var getUriPalettLink = Uri.parse(linkPalett);
    try {
      isSaving = true;
      var params = {
        'caseID': kOrderPalettData.szCaseId,
        'direction': kOrderPalettData.szDirection,
        'location': kOrderPalettData.szLocation,
        'zone': kOrderPalettData.szZone,
        'geoData': kOrderPalettData.szGeoData,
        'geoString': kOrderPalettData.szGeoString
      };
      var response = await client.post(getUriPalettLink,
          headers: kHttpHeaderBasic, body: params);
      if (response.statusCode >= 200 && response.statusCode <= 204) {        
        final responseUsers = response.body;       
        kDisplaySnackBarSavePallet(responseUsers);
      } else {
        kDisplaySnackBar('Error Status is ${response.statusCode}');
      }
    } catch (e) {
      kDisplaySnackBar('Error while getting data in $e');
    } finally {
      isSaving = false;
      client.close();
    }
    update();
    return isSaving;
  }
}
