import 'package:flutter/material.dart';
import 'package:papers/providers/providers.dart';
import 'package:provider/provider.dart';

class PopupMenu extends StatelessWidget {
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
          child: Text(
            'Cover',
            style: TextStyle(color: theme.textColor),
          ),
          onTap: () {
            provider.setBoxFit(boxFit: BoxFit.cover);
          },
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            'FitWidth',
            style: TextStyle(color: theme.textColor),
          ),
          onTap: () {
            provider.setBoxFit(boxFit: BoxFit.fitWidth);
          },
        ),
      ],
      icon: Icon(
        Icons.layers_outlined,
        color: theme.textColor,
      ),
    );
  }
}
