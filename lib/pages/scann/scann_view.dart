import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:get/get.dart';
import '../../pages/track/track_view.dart';
import '../../constants.dart';
import '../../pages/order/order_palett_view.dart';
import '../../utils/my_text_button.dart';
import '../../utils/my_text_field.dart';
//import 'package:flutter_datawedge/models/scanner_status.dart';
//import '../../pages/order/order_palett_controller.dart';
//import 'package:flutter_datawedge/models/action_result.dart';

class ScannPage extends StatefulWidget {
  const ScannPage({super.key});
  static const namedRoute = '/scan-page';

  @override
  // ignore: library_private_types_in_public_api
  _ScannPageState createState() => _ScannPageState();
}

class _ScannPageState extends State<ScannPage> {
  late TextEditingController scannDataController;
  //late OrderPalettController orderPalCtrl;

  List<ScanResult> scanResults = [];
  //String _lastStatus = '';
  Future<void>? initScannerResult;
  late FlutterDataWedge fdw;
  late StreamSubscription<ScanResult> onScanResultListener;
  //late StreamSubscription<ScannerStatus> onScannerStatusListener;
  //late StreamSubscription<ActionResult> onScannerEventListener;

  @override
  void initState() {
    //orderPalCtrl = OrderPalettController.to;
    scannDataController = TextEditingController();
    initScannerResult = initScanner();
    super.initState();
  }

  @override
  void dispose() {
    onScanResultListener.cancel();
    //onScannerStatusListener.cancel();
    //onScannerEventListener.cancel();
    scannDataController.dispose();
    super.dispose();
  }

  void onScanProcessing() {
    bool isTracking = false;
    if (scannDataController.text != '') {
      var scannText = scannDataController.text;
      if (kOrderPalettData.szScannPalletOrZone == 'P') {
        kOrderPalettData.szPaletteID = scannText;
        isTracking = false;
      } else {
        if (kOrderPalettData.szScannPalletOrZone == 'Z') {
          kOrderPalettData.szZone = scannText;
          isTracking = false;
        } else {
          if (kOrderPalettData.szScannPalletOrZone == 'T') {
            kOrderPalettData.szPaletteID = scannText;
            isTracking = true;
          }
        }
      }
      if (isTracking) {
        Get.offAndToNamed(TrackPage.namedRoute);
      } else {
        Get.offAndToNamed(OrderPalettPage.namedRoute);
      }
    }
  }

  Future<void> initScanner() async {
    if (Platform.isAndroid) {
      fdw = FlutterDataWedge();
      onScanResultListener = fdw.onScanResult.listen(
        (result) => setState(
          () {
            scanResults.add(result);
            scannDataController.text = result.data;
            onScanProcessing();
          },
        ),
      );
      // onScannerStatusListener = fdw.onScannerStatus.listen(
      //     (status) => setState(() => _lastStatus = status.status.toString()));
      await fdw.initialize();
    }
  }

  void orderManually() {
    setState(
      () {
        onScanProcessing();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //var sizeBoxListViewHeight = MediaQuery.of(context).size.height * 0.55;
    var widgetWidth = MediaQuery.of(context).size.width;
    var widgetHeight = 50.0;
    var spacerSizeHeight = 10.0;
    var buttonColor = Colors.blue.shade600;
    var buttonLabelTextColor = Colors.grey.shade200;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Scannen'),
      ),
      body: FutureBuilder(
          future: initScannerResult,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Scannen oder Eingabe',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: spacerSizeHeight),
                    MyTextField(
                      hintText: ('last scann'),
                      suffixIcon: const Icon(Icons.qr_code),
                      myController: scannDataController,
                      myTextInputType: TextInputType.text,
                      bObscureText: false,
                      mnTextfieldHeight: 50.0,
                    ),
                    SizedBox(height: spacerSizeHeight),
                    MyTextButton(
                      onTab: () => orderManually(),
                      labelText: 'Manuell speichern',
                      buttonWidth: widgetWidth,
                      buttonHeight: widgetHeight,
                      buttonColor: buttonColor,
                      buttonLabelColor: buttonLabelTextColor,
                      borderRadius: 25.0,
                    ),

                    // SizedBox(
                    //   width: double.infinity,
                    //   height: sizeBoxListViewHeight,
                    //   child: ListView.separated(
                    //     reverse: true,
                    //     itemCount: scanResults.length,
                    //     itemBuilder: (context, index) => ListTile(
                    //       title: Text(scanResults[index].data),
                    //     ),
                    //     separatorBuilder: (context, index) => Divider(
                    //       color: Colors.grey.shade800,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
