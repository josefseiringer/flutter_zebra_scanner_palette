import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../pages/track/track_model.dart';
import '../../constants.dart';

class TrackController extends GetxController {
  static TrackController get to => Get.find<TrackController>();
  final trackingList = <TrackModel>[].obs;
  final trackingImagePathLeer = 'lib/images/leerPaletteTrackingImage.png'.obs;
  final trackingImagePathVoll = 'lib/images/vollePaletteTrackingImage.png'.obs;
  final bIsLoading = false.obs;

  @override
  void onReady() async {
    await getTrackingListDataFromPalette();
  }

  @override
  void onClose() {}

  Future<void> getTrackingListDataFromPalette() async {
    var client = http.Client();
    var trackingPaletteLinkEnv = dotenv.env['API__GET_LINK_PALETT_INFO'];
    var getTrackingLink = Uri.parse(
        '${trackingPaletteLinkEnv!}paletteID=${kOrderPalettData.szPaletteID}');
    try {
      bIsLoading(true);
      var response =
          await client.get(getTrackingLink, headers: kHttpHeaderBasic);
      if (response.statusCode >= 200 && response.statusCode <= 204) {
        //data successfully
        //Parse the JSON data
        final responseTrackingData = response.body;
        final Map<String, dynamic> jsonData = jsonDecode(responseTrackingData);
        //Convert the JSON data to a list of Dart objects
        final List<dynamic> mapData = jsonData['data']['trackPoints'];
        final List<TrackModel> asyncList =
            mapData.map((json) => TrackModel.fromMap(json)).toList();
        trackingList.value = asyncList;
      } else {
        kDisplaySnackBar('Error Status is ${response.statusCode}');
      }
    } catch (e) {
      kDisplaySnackBar('Error while getting data in $e');
    } finally {
      bIsLoading(false);
      client.close();
    }
    update();
  }
}
