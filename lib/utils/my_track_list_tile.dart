import 'package:flutter/material.dart';
import '../pages/track/track_model.dart';
import '../constants.dart';

class MyTrackListTile extends StatelessWidget {
  final TrackModel itemData;

  const MyTrackListTile({
    super.key,
    required this.itemData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: kContainerlabelColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: kCircularAvatarBackgroundColor,
            radius: 30,
            child: Image(
              image: itemData.szCaseID == '1' || itemData.szCaseID == '3'
                  ? const AssetImage('lib/images/vollePaletteTrackingImage.png')
                  : const AssetImage('lib/images/leerPaletteTrackingImage.png'),
            ),
          ),
          const SizedBox(width: 20.0),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30.0)),
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${itemData.szDate!.substring(0, (itemData.szDate!.length) - 5)}, ${itemData.szTime!.substring(0, (itemData.szTime!.length) - 3)}',
                ),
                Text(itemData.szLocation!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
