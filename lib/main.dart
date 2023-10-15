import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../http_overrides.dart';
import '../sample_bindings.dart';
import '../sample_routs.dart';
import '../pages/scann/scann_view.dart';

void main() {
  SampleBindings().dependencies();
  HttpOverrides.global = MyHttpOverrides();
  return runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter DataWedge Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ScannPage.namedRoute,
      getPages: SampleRouts.samplePages,
    ),
  );
}
