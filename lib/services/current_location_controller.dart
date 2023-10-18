import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../constants.dart';

class CurrentLocationController extends GetxController {
  static CurrentLocationController get to =>
      Get.find<CurrentLocationController>();

  final hasInternet = false.obs;
  final locationData = 'Kein Standort gefunden!\nBitte GPS aktivieren!'.obs;
  final latitude = '0.0'.obs;
  final longitude = '0.0'.obs;
  final rxGeoString = '?'.obs;

  //check if we have internet connection
  Future<bool> checkInternetConnection() async {
    if (await InternetConnectionChecker().hasConnection) {
      hasInternet.value = true;
    } else {
      hasInternet.value = false;
      kDisplaySnackBar('Bitte mobile Daten aktivieren!');
    }
    update();
    return hasInternet.value;
  }

//Adresse des Standortes ermitteln
  Future<bool> getLocation() async {
    var strasse = 'Ganglgutstrasse%131';
    var country = 'AT';
    //
    bool getLocation = false;
    var ptcApiKey = dotenv.env['PTV_API_KEY'];
    //
    //Get Address from Long and Latitude
    var newGetLink =
        'https://api.myptv.com/geocoding/v1/locations/by-text?searchText=$strasse&countryFilter=$country&apiKey=$ptcApiKey';
    // String ptvGeoLink =
    //     'https://api.myptv.com/geocoding/v1/locations/by-position/${latitude.value}/${longitude.value}?language=de&apiKey=$ptcApiKey';
    var client = http.Client();
    var response = await client.get(Uri.parse(newGetLink));
    //Response Data status
    if (response.statusCode == 200) {
      //Response is succsessful
      Map<String, dynamic> data =
          json.decode(utf8.decode(response.bodyBytes)); //get response data
      Map<String, dynamic> mapOfAddressfromPosition =
          data['locations'][0]; //get response location data
      if (mapOfAddressfromPosition.isNotEmpty) {
        // locationData.value =
        //     '${mapOfAddressfromPosition['street'].toString()} ${mapOfAddressfromPosition['houseNumber'].toString()}, ${mapOfAddressfromPosition['postalCode'].toString()} ${mapOfAddressfromPosition['city'].toString()}';
        locationData.value =
            mapOfAddressfromPosition['address']['city'].toString();
        rxGeoString.value =
            mapOfAddressfromPosition['address']['street'].toString();
        longitude.value = mapOfAddressfromPosition['referencePosition']
                ['longitude']
            .toString();
        latitude.value = mapOfAddressfromPosition['referencePosition']
                ['latitude']
            .toString();
        getLocation = true;
      } else {
        kDisplaySnackBar('Aktueller Standort wurde nicht gefunden!');
      }
    }
    client.close();
    update();
    return getLocation;
  }
}
