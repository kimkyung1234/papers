import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            CustomText(
              text: 'Settings',
              fontSize: 30,
              textColor: theme.textColor!,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 7, top: 10, bottom: 12),
            ),
            _settingMenu(
              text: 'Dark mode',
              hintText: themeMode.getThemeDark ? 'On' : 'Off',
              textColor: theme.textColor!,
              widget: CupertinoSwitch(
                value: themeMode.getThemeDark,
                onChanged: (value) async {
                  themeMode.getThemeDark
                      ? themeMode.setLight()
                      : themeMode.setDark();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _settingMenu({
  required String text,
  required Widget widget,
  required Color textColor,
  String hintText = '',
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: text,
            textColor: textColor,
            fontWeight: FontWeight.w600,
          ),
          Row(
            children: [
              CustomText(
                text: hintText,
                fontSize: 17,
                textColor: Colors.grey,
                padding: const EdgeInsets.only(right: 15),
              ),
              widget,
            ],
          ),
        ],
      ),
    ),
  );
}
