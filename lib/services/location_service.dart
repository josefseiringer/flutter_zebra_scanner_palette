import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<bool> requestPermission() async {
    final permission = await location.requestPermission();
    return permission == PermissionStatus.granted;
  }

  Future<LocationData> getCurrentLocation() async {
    final serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      var result = location.requestService;
        if (result == true) {
          print('Service has been enabled');
        } else {
             throw Exception('GPS service not enabled');
          }
       }
    final locationData = await location.getLocation();
    return locationData;
  }
}