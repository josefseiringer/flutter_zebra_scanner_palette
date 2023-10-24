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
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: kContainerlabelColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: kCircularAvatarColor,
            foregroundColor: kContainerlabelColor,
            radius: 30,
            child: Image(
              image: itemData.szCaseID == '1' || itemData.szCaseID == '3'
                  ? const AssetImage('lib/images/vollePaletteTrackingImage.png')
                  : const AssetImage('lib/images/leerPaletteTrackingImage.png'),
            ),
          ),
          const SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(itemData.szDate!),
              Text(itemData.szTime!),
              Text(itemData.szLocation!),
              Text(itemData.szZoneInfo!),
            ],
          ),
        ],
      ),
    );
  }
}
