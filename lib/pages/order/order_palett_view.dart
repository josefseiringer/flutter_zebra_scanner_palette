import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/my_text_button.dart';
import 'order_palett_controller.dart';

class OrderPalettPage extends GetView<OrderPalettController> {
  static const namedRoute = '/order-palett-page';
  const OrderPalettPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderPallCtrl = controller;
    var spacer = 10.0;
    var widgetHeigth = 50.0;
    var buttonColor = Colors.blue.shade500;
    var labelColor = Colors.grey.shade200;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Palettenzuordnung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green.shade100,
              padding: const EdgeInsets.all(10),
              child: Obx(
                () => orderPallCtrl.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'PalettenID: ${orderPallCtrl.currOrderModel.value.szPaletteID!}'),
                          Text(
                              'CaseId: ${orderPallCtrl.currOrderModel.value.szCaseId!}'),
                          Text(
                              'Direction: ${orderPallCtrl.currOrderModel.value.szDirection!}'),
                          Text(
                              'Zone: ${orderPallCtrl.currOrderModel.value.szZone!}'),
                          Text(
                              'GeoData: ${orderPallCtrl.currOrderModel.value.szGeoData!}'),
                          Text(
                              'GeoString: ${orderPallCtrl.currOrderModel.value.szGeoString!}'),
                          Text(
                              'Location: ${orderPallCtrl.currOrderModel.value.szLocation!}'),
                        ],
                      ),
              ),
            ),
            SizedBox(height: spacer),
            MyTextButton(
                onTab: () => orderPallCtrl.goToScanPage(),
                labelText: 'Scan Palette',
                buttonWidth: double.infinity,
                buttonHeight: widgetHeigth,
                buttonColor: buttonColor,
                buttonLabelColor: labelColor),
            SizedBox(height: spacer),
            MyTextButton(
                onTab: () {},
                labelText: 'Scan Zone',
                buttonWidth: double.infinity,
                buttonHeight: widgetHeigth,
                buttonColor: buttonColor,
                buttonLabelColor: labelColor),
            SizedBox(height: spacer),
            MyTextButton(
                onTab: () {},
                labelText: 'Take Palette',
                buttonWidth: double.infinity,
                buttonHeight: widgetHeigth,
                buttonColor: buttonColor,
                buttonLabelColor: labelColor)
          ],
        ),
      ),
    );
  }
}
