import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../http_overrides.dart';
import '../sample_routs.dart';
import '../pages/login/login_view.dart';

void main() async {
  await dotenv.load(fileName: 'lib/.env');
  HttpOverrides.global = MyHttpOverrides();
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
