import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../services/current_location_controller.dart';
import '../constants.dart';
import '../pages/login/login_controller.dart';
import '../http_overrides.dart';
import '../sample_routs.dart';
import '../pages/login/login_view.dart';
import '../pages/palett/palett_controller.dart';
import '../pages/order/order_palett_controller.dart';

void main() async {
  await dotenv.load(fileName: 'lib/.env');
  HttpOverrides.global = MyHttpOverrides();
  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
  Get.lazyPut<PalettController>(() => PalettController(), fenix: true);
  Get.lazyPut<OrderPalettController>(() => OrderPalettController(), fenix: true);
  Get.lazyPut<CurrentLocationController>(() => CurrentLocationController(), fenix: true);
  return runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internorm Palette',
      theme: kThemeData,
      initialRoute: LoginPage.namedRoute,
      getPages: SampleRouts.samplePages,
    ),
  );
}
