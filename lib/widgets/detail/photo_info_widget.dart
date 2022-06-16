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
              textColor: theme.textColor!,
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
              textColor: theme.textColor!,
              fontSize: 14,
            )
          ],
        ),
      ],
    );
  }
}
