import 'package:get/get.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter_datawedge/models/action_result.dart';
import 'package:flutter_datawedge/models/scan_result.dart';
import 'package:flutter_datawedge/models/scanner_status.dart';

class ScannController extends GetxController {
  static ScannController get to => Get.find<ScannController>();

  late StreamSubscription<ScanResult> _onScanResultListener;
  late StreamSubscription<ScannerStatus> _onScannerStatusListener;
  late StreamSubscription<ActionResult> _onScannerEventListener;
  late FlutterDataWedge _fdw;

  final scanResults = [].obs;
  final lastStatus = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await _initScanner();
  }

  Future<void> _initScanner() async {
    if (Platform.isAndroid) {
      _fdw = FlutterDataWedge(profileName: 'FlutterDataWedge');
      _onScanResultListener =
          _fdw.onScanResult.listen((result) => scanResults.add(result));
      _onScannerStatusListener = _fdw.onScannerStatus
          .listen((status) => lastStatus.value = status.status.toString());
      await _fdw.initialize();
    }
    update();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    _onScanResultListener.cancel();
    _onScannerStatusListener.cancel();
    _onScannerEventListener.cancel();
  }
}
