import 'package:flutter/material.dart';
import 'package:flutter_zebra_scanner_palette/utils/my_text_button.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'palett_controller.dart';

class PalettPage extends GetView<PalettController> {
  static const namedRoute = '/palett-page';

  const PalettPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    var displayButtonHeight = 50.0;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Palettenadministration'),
      ),
      body: SafeArea(
        child: GetBuilder<PalettController>(
          builder: (pCtrl) => Obx(
            () => ListView(
              padding: const EdgeInsets.all(8),
              children: [
                MyTextButton(
                  onTab: () {},
                  labelText: 'Volle Palette einlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                SizedBox(
                  height: pCtrl.mnVollEin.value,
                  child: Center(
                    child: Text(
                      pCtrl.szPallScanCode.value,
                      style: kTestStyleDataText,
                    ),
                  ),
                ),
                MyTextButton(
                  onTab: () {},
                  labelText: 'Volle Palette auslagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                SizedBox(height: pCtrl.mnVollAus.value),
                MyTextButton(
                  onTab: () {},
                  labelText: 'Leere Palette einlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                SizedBox(height: pCtrl.mnLeerEin.value),
                MyTextButton(
                  onTab: () {},
                  labelText: 'Leere Palette auslagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                SizedBox(height: pCtrl.mnLeerAus.value),
                MyTextButton(
                  onTab: () {},
                  labelText: 'Volle Palette umlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                SizedBox(height: pCtrl.mnVollUm.value),
                MyTextButton(
                  onTab: () {},
                  labelText: 'Leere Palette umlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                SizedBox(height: pCtrl.mnLeerUm.value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
