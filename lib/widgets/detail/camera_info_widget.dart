import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CameraInfoWidget extends StatelessWidget {
  final Exif exif;
  final double fontSize;
  final AlignmentGeometry fontAlignment;

  const CameraInfoWidget({
    super.key,
    required this.exif,
    this.fontSize = 12,
    this.fontAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          CustomText(
            text: 'camera',
            fontSize: fontSize,
            textColor: Colors.grey,
            padding: const EdgeInsets.only(bottom: 5),
            alignment: fontAlignment,
          ),
          CustomText(
            text: '${exif.make}, ${exif.model}',
            textColor: theme.textColor!,
            fontSize: fontSize,
            alignment: fontAlignment,
          ),
          const SizedBox(height: 14),
          CustomText(
            text: 'Lens',
            fontSize: fontSize,
            textColor: Colors.grey,
            padding: const EdgeInsets.only(bottom: 5),
            alignment: fontAlignment,
          ),
          CustomText(
            text: '${exif.focalLength!}mm, f/${exif.aperture}',
            textColor: theme.textColor!,
            fontSize: fontSize,
            alignment: fontAlignment,
          ),
          CustomText(
            text: '${exif.exposureTime}s',
            textColor: theme.textColor!,
            fontSize: fontSize,
            alignment: fontAlignment,
          ),
          CustomText(
            text: 'ISO ${exif.iso}',
            textColor: theme.textColor!,
            fontSize: fontSize,
            alignment: fontAlignment,
          )
        ],
      ),
    );
  }
}
