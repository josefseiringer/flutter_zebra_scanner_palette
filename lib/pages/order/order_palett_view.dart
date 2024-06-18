import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Palettenzuordnung'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: kContainerBoxDecorationGreen,
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
                                'Zone: ${orderPallCtrl.currOrderModel.value.szZone!}'),
                            Text(
                                'Location: ${orderPallCtrl.currOrderModel.value.szLocation!}'),
                            Text(
                                'CaseId: ${orderPallCtrl.currOrderModel.value.szCaseId!}'),
                            Text(
                                'Direction: ${orderPallCtrl.currOrderModel.value.szDirection!}'),
                            // Text(
                            //     'GeoData: ${orderPallCtrl.currOrderModel.value.szGeoData!}'),
                            // Text(
                            //     'GeoString: ${orderPallCtrl.currOrderModel.value.szGeoString!}'),
                            // Text(
                            //     'Pall/Zone: ${orderPallCtrl.currOrderModel.value.szScannPalletOrZone!}'),
                          ],
                        ),
                ),
              ),
              SizedBox(height: spacer),
              MyTextButton(
                  onTab: () => orderPallCtrl.goToScanPagePalette(),
                  labelText: 'Palette scannen',
                  buttonWidth: double.infinity,
                  buttonHeight: widgetHeigth,
                  buttonColor: kContainerButtonColor,
                  buttonLabelColor: kContainerlabelColor),
              SizedBox(height: spacer),
              MyTextButton(
                  onTab: () => orderPallCtrl.goToScanPageZone(),
                  labelText: 'Zone scannen',
                  buttonWidth: double.infinity,
                  buttonHeight: widgetHeigth,
                  buttonColor: kContainerButtonColor,
                  buttonLabelColor: kContainerlabelColor),
              SizedBox(height: spacer),
              MyTextButton(
                onTab: () => orderPallCtrl.saveAndExit(),
                labelText: 'OK',
                buttonWidth: double.infinity,
                buttonHeight: widgetHeigth,
                buttonColor: kContainerButtonColor,
                buttonLabelColor: kContainerlabelColor,
              ),
              SizedBox(height: spacer),
              MyTextButton(
                onTab: () => orderPallCtrl.exitToPage(),
                labelText: 'Exit',
                buttonWidth: double.infinity,
                buttonHeight: widgetHeigth,
                buttonColor: kContainerButtonColor,
                buttonLabelColor: kContainerlabelColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
