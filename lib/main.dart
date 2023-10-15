import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../pages/login/login_controller.dart';
import '../http_overrides.dart';
import '../sample_routs.dart';
import '../pages/login/login_view.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
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
