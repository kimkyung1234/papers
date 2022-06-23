import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PopupMenu extends StatelessWidget {
  final Photo data;

  const PopupMenu({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

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
                'Cover',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getBoxFit == BoxFit.cover
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setBoxFit(boxFit: BoxFit.cover);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FitWidth',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getBoxFit == BoxFit.fitWidth
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setBoxFit(boxFit: BoxFit.fitWidth);
          },
        ),
        PopupMenuItem(
          value: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contain',
                style: TextStyle(color: theme.textColor),
              ),
              provider.getBoxFit == BoxFit.contain
                  ? Icon(Icons.check, color: theme.textColor)
                  : const SizedBox.shrink()
            ],
          ),
          onTap: () {
            provider.setBoxFit(boxFit: BoxFit.contain);
          },
        ),
        PopupMenuItem(
          value: 4,
          child: ImageSizeMenuWidget(data: data),
        ),
      ],
      icon: Icon(
        Icons.layers_outlined,
        color: theme.textColor,
      ),
    );
  }
}
