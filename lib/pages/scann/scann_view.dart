import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_datawedge/flutter_datawedge.dart';
import 'package:flutter_datawedge/models/action_result.dart';
import 'package:flutter_datawedge/models/scan_result.dart';
import 'package:flutter_datawedge/models/scanner_status.dart';

class ScannPage extends StatefulWidget {
  const ScannPage({super.key});
  static const namedRoute = '/';

  @override
  _ScannPageState createState() => _ScannPageState();
}

class _ScannPageState extends State<ScannPage> {
  late StreamSubscription<ScanResult> onScanResultListener;
  late StreamSubscription<ScannerStatus> onScannerStatusListener;
  late StreamSubscription<ActionResult> onScannerEventListener;

  List<ScanResult> scanResults = [];
  String _lastStatus = '';
  late FlutterDataWedge fdw;
  Future<void>? initScannerResult;
  @override
  void initState() {
    super.initState();
    initScannerResult = initScanner();
  }

  Future<void> initScanner() async {
    if (Platform.isAndroid) {
      fdw = FlutterDataWedge(profileName: 'FlutterDataWedge');
      onScanResultListener = fdw.onScanResult
          .listen((result) => setState(() => scanResults.add(result)));
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter DataWedge Example'),
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
                    const Text('Last codes:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.6,
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
                        const Expanded(
                          child: Text('Last status:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Expanded(
                          child: Text(_lastStatus,
                              style: Theme.of(context).textTheme.headlineSmall),
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
