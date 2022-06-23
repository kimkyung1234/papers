import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PhotoInfoWidget extends StatelessWidget {
  final Photo photoData;

  const PhotoInfoWidget({
    super.key,
    required this.photoData,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    double headTextSize;
    double smallTextSize;

    if (MediaQuery.of(context).size.width > 600) {
      headTextSize = 16;
      smallTextSize = 18;
    } else {
      headTextSize = 12;
      smallTextSize = 14;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'views',
              fontSize: headTextSize,
              textColor: Colors.grey,
              padding: const EdgeInsets.only(bottom: 5),
            ),
            CustomText(
              text: photoData.views.toString(),
              textColor: theme.textColor!,
              fontSize: smallTextSize,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'downloads',
              fontSize: headTextSize,
              textColor: Colors.grey,
              padding: const EdgeInsets.only(bottom: 5),
            ),
            CustomText(
              text: photoData.downloads.toString(),
              textColor: theme.textColor!,
              fontSize: smallTextSize,
            )
          ],
        ),
      ],
    );
  }
}
