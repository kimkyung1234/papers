import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/widgets/widgets.dart';

class PhotoInfoWidget extends StatelessWidget {
  final Photo photoData;

  const PhotoInfoWidget({
    super.key,
    required this.photoData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'views',
              fontSize: 12,
              textColor: Colors.grey,
              padding: EdgeInsets.only(bottom: 5),
            ),
            CustomText(
              text: photoData.views.toString(),
              fontSize: 14,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'downloads',
              fontSize: 12,
              textColor: Colors.grey,
              padding: EdgeInsets.only(bottom: 5),
            ),
            CustomText(
              text: photoData.downloads.toString(),
              fontSize: 14,
            )
          ],
        ),
      ],
    );
  }
}
