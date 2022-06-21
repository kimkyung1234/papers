import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class ImageSizeMenuWidget extends StatelessWidget {
  final Photo data;

  const ImageSizeMenuWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    Urls urls = data.urls!;

    return PopupMenuButton<int>(
      color: theme.cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            'Small',
            style: TextStyle(color: theme.textColor),
          ),
          onTap: () {
            provider.setImageUrl(url: urls.smallUrl!);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'Medium',
            style: TextStyle(color: theme.textColor),
          ),
          onTap: () {
            provider.setImageUrl(url: urls.regularUrl!);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'Large',
            style: TextStyle(color: theme.textColor),
          ),
          onTap: () {
            provider.setImageUrl(url: urls.rawUrl!);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'Original Size',
            style: TextStyle(color: theme.textColor),
          ),
          onTap: () {
            provider.setImageUrl(url: urls.fullUrl!);
          },
        ),
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Image Size',
            style: TextStyle(color: theme.textColor),
          ),
          Icon(Icons.keyboard_arrow_down, color: theme.textColor),
        ],
      ),
    );
  }
}
