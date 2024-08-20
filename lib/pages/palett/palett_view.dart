import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'palett_controller.dart';
import '../../pages/login/login_view.dart';
import '../../utils/my_cont_image_button.dart';
import '../../utils/my_text_button.dart';
import '../../constants.dart';

class PalettPage extends GetView<PalettController> {
  static const namedRoute = '/palett-page';

  const PalettPage({super.key});

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
                  borderRadius: 25.0,
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
              SizedBox(height: kSpaceHeight),
              MyTextButton(
                buttonColor: kContainerButtonColor,
                buttonHeight: 70.0,
                buttonLabelColor: kContainerlabelColor,
                buttonWidth: double.infinity,
                borderRadius: 35.0,
                labelText: 'Tracking Info',
                onTab: () => pCtrl.goToTracking(PalettenStatus.tracking),
              )
            ],
          ),
        ),
      ),
    );
  }
}
