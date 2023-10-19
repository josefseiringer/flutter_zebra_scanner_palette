import '../constants.dart';

class OrderModel {
  late String? szPaletteID;
  late String? szCaseId;
  late String? szDirection;
  late String? szLocation;
  late String? szZone;
  late String? szGeoData;
  late String? szGeoString;
  late String? szScannPalletOrZone;

  OrderModel(
    this.szPaletteID,
    this.szCaseId,
    this.szDirection,
    this.szLocation,
    this.szZone,
    this.szGeoData,
    this.szGeoString,
    this.szScannPalletOrZone,
  );

  OrderModel? currentOrderModel(
    String? paletteId,
    PalettenStatus? status,
    String? location,
    String? zone,
    String? geoData,
    String? geoString,
    String? scannPalletOrZone,
  ) {
    switch (status) {
      case PalettenStatus.eingang:
        return OrderModel(
          szCaseId = '1',
          szDirection = 'I',
          szPaletteID = paletteId,
          szLocation = location,
          szZone = zone,
          szGeoData = geoData,
          szGeoString = geoString,
          szScannPalletOrZone = scannPalletOrZone,
        );
      case PalettenStatus.eingangLeer:
        return OrderModel(
          szCaseId = '4',
          szDirection = 'I',
          szPaletteID = paletteId,
          szLocation = location,
          szZone = zone,
          szGeoData = geoData,
          szGeoString = geoString,
          szScannPalletOrZone = scannPalletOrZone,
        );
      case PalettenStatus.ausgang:
        return OrderModel(
          szCaseId = '3',
          szDirection = 'O',
          szPaletteID = paletteId,
          szLocation = location,
          szZone = zone,
          szGeoData = geoData,
          szGeoString = geoString,
          szScannPalletOrZone = scannPalletOrZone,
        );
      case PalettenStatus.ausgangLeer:
        return OrderModel(
          szCaseId = '5',
          szDirection = 'O',
          szPaletteID = paletteId,
          szLocation = location,
          szZone = zone,
          szGeoData = geoData,
          szGeoString = geoString,
          szScannPalletOrZone = scannPalletOrZone,
        );
      case PalettenStatus.umlagerung:
        return OrderModel(
          szCaseId = '2',
          szDirection = 'I',
          szPaletteID = paletteId,
          szLocation = location,
          szZone = zone,
          szGeoData = geoData,
          szGeoString = geoString,
          szScannPalletOrZone = scannPalletOrZone,
        );
      default:
        return null;
    }
  }
}
