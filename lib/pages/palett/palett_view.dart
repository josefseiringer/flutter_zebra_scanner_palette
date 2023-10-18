import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'palett_controller.dart';
import '../../utils/my_text_button.dart';
import '../../constants.dart';

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
                  onTab: () => pCtrl.openOrderView(PalettenStatus.eingang),
                  labelText: 'Volle Palette einlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                pCtrl.bVollEin.value
                    ? SizedBox(
                        height: pCtrl.mnVollEin.value,
                        child: Center(
                          child: Text(
                            pCtrl.szPallScanCode.value,
                            style: kTestStyleDataText,
                          ),
                        ),
                      )
                    : SizedBox(height: pCtrl.mnVollEin.value),
                MyTextButton(
                  onTab: () => pCtrl.openOrderView(PalettenStatus.eingangLeer),
                  labelText: 'Leere Palette einlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                pCtrl.bLeerEin.value
                    ? SizedBox(
                        height: pCtrl.mnLeerEin.value,
                        child: Center(
                          child: Text(
                            pCtrl.szPallScanCode.value,
                            style: kTestStyleDataText,
                          ),
                        ))
                    : SizedBox(height: pCtrl.mnLeerEin.value),
                MyTextButton(
                  onTab: () => pCtrl.openOrderView(PalettenStatus.ausgang),
                  labelText: 'Volle Palette auslagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                pCtrl.bVollAus.value
                    ? SizedBox(
                        height: pCtrl.mnVollAus.value,
                        child: Center(
                          child: Text(
                            pCtrl.szPallScanCode.value,
                            style: kTestStyleDataText,
                          ),
                        ),
                      )
                    : SizedBox(height: pCtrl.mnVollAus.value),
                MyTextButton(
                  onTab: () => pCtrl.openOrderView(PalettenStatus.ausgangLeer),
                  labelText: 'Leere Palette auslagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                pCtrl.bLeerAus.value
                    ? SizedBox(
                        height: pCtrl.mnLeerAus.value,
                        child: Center(
                          child: Text(
                            pCtrl.szPallScanCode.value,
                            style: kTestStyleDataText,
                          ),
                        ),
                      )
                    : SizedBox(height: pCtrl.mnLeerAus.value),
                MyTextButton(
                  onTab: () => pCtrl.openOrderView(PalettenStatus.umlagerung),
                  labelText: 'Palette umlagern...',
                  buttonWidth: displayWidth,
                  buttonHeight: displayButtonHeight,
                  buttonColor: Colors.blue.shade600,
                  buttonLabelColor: Colors.grey.shade200,
                ),
                pCtrl.bPallUm.value
                    ? SizedBox(
                        height: pCtrl.mnPallUm.value,
                        child: Center(
                          child: Text(
                            pCtrl.szPallScanCode.value,
                            style: kTestStyleDataText,
                          ),
                        ),
                      )
                    : SizedBox(height: pCtrl.mnPallUm.value),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
