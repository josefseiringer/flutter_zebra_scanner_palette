import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter_datawedge/models/action_result.dart';
import 'package:flutter_datawedge/models/scan_result.dart';
import 'package:flutter_datawedge/models/scanner_status.dart';
import 'package:flutter_zebra_scanner_palette/utils/my_text_field.dart';

class ScannPage extends StatefulWidget {
  const ScannPage({super.key});
  static const namedRoute = '/scan_page';

  @override
  _ScannPageState createState() => _ScannPageState();
}

class _ScannPageState extends State<ScannPage> {
  late FlutterDataWedge fdw;
  late StreamSubscription<ScanResult> onScanResultListener;
  late StreamSubscription<ScannerStatus> onScannerStatusListener;
  late StreamSubscription<ActionResult> onScannerEventListener;
  late TextEditingController scannDataController;

  List<ScanResult> scanResults = [];
  String _lastStatus = '';
  Future<void>? initScannerResult;
  @override
  void initState() {
    scannDataController = TextEditingController();
    initScannerResult = initScanner();
    super.initState();
  }

  Future<void> initScanner() async {
    if (Platform.isAndroid) {
      fdw = FlutterDataWedge(profileName: 'FlutterDataWedge');
      onScanResultListener = fdw.onScanResult.listen((result) => setState(() {
            scanResults.add(result);
            scannDataController.text = result.data;
          }));
      onScannerStatusListener = fdw.onScannerStatus.listen(
          (status) => setState(() => _lastStatus = status.status.toString()));
      await fdw.initialize();
    }
  }

  @override
  void dispose() {
    onScanResultListener.cancel();
    onScannerStatusListener.cancel();
    onScannerEventListener.cancel();
    scannDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeBoxListViewHeight = MediaQuery.of(context).size.height * 0.55;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Palett scanner'),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextField(
                      hintText: ('last scann'),
                      suffixIcon: const Icon(Icons.qr_code),
                      myController: scannDataController,
                      myTextInputType: TextInputType.text,
                      bObscureText: false,
                      mnTextfieldHeight: 50.0,
                    ),
                    const Text(
                      'Last codes:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: sizeBoxListViewHeight,
                      child: ListView.separated(
                        reverse: true,
                        itemCount: scanResults.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(scanResults[index].data),
                        ),
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        const Text(
                          'Last status:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          _lastStatus,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
