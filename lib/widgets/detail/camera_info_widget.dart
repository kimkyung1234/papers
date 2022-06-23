import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CameraInfoWidget extends StatelessWidget {
  final Exif exif;
  final AlignmentGeometry fontAlignment;

  const CameraInfoWidget({
    super.key,
    required this.exif,
    this.fontAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    double textSize;

    if (MediaQuery.of(context).size.width > 600) {
      textSize = 16;
    } else {
      textSize = 12;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          CustomText(
            text: 'camera',
            fontSize: textSize,
            textColor: Colors.grey,
            padding: const EdgeInsets.only(bottom: 5),
            alignment: fontAlignment,
          ),
          CustomText(
            text: '${exif.make}, ${exif.model}',
            textColor: theme.textColor!,
            fontSize: textSize,
            alignment: fontAlignment,
          ),
          const SizedBox(height: 14),
          CustomText(
            text: 'Lens',
            fontSize: textSize,
            textColor: Colors.grey,
            padding: const EdgeInsets.only(bottom: 5),
            alignment: fontAlignment,
          ),
          CustomText(
            text: '${exif.focalLength!}mm, f/${exif.aperture}',
            textColor: theme.textColor!,
            fontSize: textSize,
            alignment: fontAlignment,
          ),
          CustomText(
            text: '${exif.exposureTime}s',
            textColor: theme.textColor!,
            fontSize: textSize,
            alignment: fontAlignment,
          ),
          CustomText(
            text: 'ISO ${exif.iso}',
            textColor: theme.textColor!,
            fontSize: textSize,
            alignment: fontAlignment,
          )
        ],
      ),
    );
  }
}
