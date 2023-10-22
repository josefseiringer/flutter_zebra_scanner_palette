import 'package:flutter/material.dart';
import 'package:flutter_zebra_scanner_palette/pages/login/login_view.dart';
import 'package:flutter_zebra_scanner_palette/utils/my_cont_image_button.dart';
import 'package:get/get.dart';
import 'palett_controller.dart';
import '../../constants.dart';

class PalettPage extends GetView<PalettController> {
  static const namedRoute = '/palett-page';

  const PalettPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Palettenadministration'),
        actions: [
          IconButton(
              onPressed: () => Get.offAndToNamed(LoginPage.namedRoute),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: GetBuilder<PalettController>(
          builder: (pCtrl) => ListView(
            padding: const EdgeInsets.all(8),
            children: [
              MyContainerImageButton(
                  pathToImage: 'lib/images/palletFull.png',
                  onTab: () => pCtrl.openOrderView(PalettenStatus.eingang),
                  labelText: 'Volle Palette einlagern...'),
              SizedBox(height: kSpaceHeight),
              MyContainerImageButton(
                  pathToImage: 'lib/images/palletEmpty.png',
                  onTab: () => pCtrl.openOrderView(PalettenStatus.eingangLeer),
                  labelText: 'Leere Palette einlagern...'),
              SizedBox(height: kSpaceHeight),
              MyContainerImageButton(
                  pathToImage: 'lib/images/palletFull.png',
                  onTab: () => pCtrl.openOrderView(PalettenStatus.ausgang),
                  labelText: 'Volle Palette auslagern...'),
              SizedBox(height: kSpaceHeight),
              MyContainerImageButton(
                  pathToImage: 'lib/images/palletEmpty.png',
                  onTab: () => pCtrl.openOrderView(PalettenStatus.ausgangLeer),
                  labelText: 'Leere Palette auslagern...'),
              SizedBox(height: kSpaceHeight),
              MyContainerImageButton(
                  pathToImage: 'lib/images/palletFull.png',
                  onTab: () => pCtrl.openOrderView(PalettenStatus.umlagerung),
                  labelText: 'Palette umlagern...'),
            ],
          ),
        ),
      ),
    );
  }
}
