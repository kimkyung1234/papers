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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Small',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getType == 'small'
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setImageUrl(url: urls.smallUrl!, type: 'small');
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Medium',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getType == 'medium'
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setImageUrl(url: urls.regularUrl!, type: 'medium');
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Large',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getType == 'large'
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setImageUrl(url: urls.rawUrl!, type: 'large');
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Original Size',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getType == 'original size'
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setImageUrl(url: urls.fullUrl!, type: 'original size');
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
