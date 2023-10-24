import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'track_controller.dart';
import '../../utils/my_track_list_tile.dart';

class TrackPage extends GetView<TrackController> {
  static const namedRoute = '/track-page';
  const TrackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var trackCtrl = TrackController.to;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Track Info ${kOrderPalettData.szPaletteID}',
          ),
        ),
        body: SafeArea(
          child: trackCtrl.bIsLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Sendungsverlauf',
                            style: kTextStyleHeaderTextBold),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: trackCtrl.trackingList.length,
                        itemBuilder: (context, index) => MyTrackListTile(
                          itemData: trackCtrl.trackingList[index],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
