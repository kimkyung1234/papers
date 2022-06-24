import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';
import 'package:papers/providers/providers.dart';
import 'package:papers/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var settingProvide = Provider.of<SettingProvider>(context);
    var themeMode = Provider.of<ThemeChangerProvider>(context);
    var theme = themeMode.getThemeData;

    double headTextSize;
    bool isPad;

    if (MediaQuery.of(context).size.width > 600) {
      headTextSize = 50;
      isPad = true;
    } else {
      headTextSize = 30;
      isPad = false;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            CustomText(
              text: 'Settings',
              fontSize: headTextSize,
              textColor: theme.textColor!,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 7, top: 10, bottom: 12),
            ),
            _settingMenu(
              text: 'Dark Mode',
              hintText: themeMode.getThemeDark ? 'On' : 'Off',
              textColor: theme.textColor!,
              widget: CupertinoSwitch(
                value: themeMode.getThemeDark,
                onChanged: (value) async {
                  themeMode.getThemeDark
                      ? themeMode.setLight()
                      : themeMode.setDark();

                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();

                  sharedPreferences.setBool('theme', value);
                },
              ),
            ),
            _settingMenu(
              text: 'Image Fit',
              textColor: theme.textColor!,
              widget: TextButton(
                child: Text(settingProvide.getImageFit),
                onPressed: () {
                  _showPicker(context, settingProvide, theme);
                },
              ),
            ),
            isPad
                ? _settingMenu(
                    text: 'Cross Axis Count',
                    textColor: theme.textColor!,
                    widget: TextButton(
                      child: Text(settingProvide.getCrossAxisCount.toString()),
                      onPressed: () {
                        _showCrossAxisCountPicker(
                            context, settingProvide, theme);
                      },
                    ),
                  )
                : const SizedBox.shrink()
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
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
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
                fontSize: 14,
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

void _showPicker(
  BuildContext context,
  SettingProvider imageFit,
  ColorTheme theme,
) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => SizedBox(
      height: 250,
      child: CupertinoPicker(
        backgroundColor: theme.backgroundColor,
        itemExtent: 30,
        scrollController: FixedExtentScrollController(
            initialItem: imageFit.getImageFit == 'Filled' ? 0 : 1),
        children: [
          Text('Filled', style: TextStyle(color: theme.textColor)),
          Text('Padding', style: TextStyle(color: theme.textColor)),
        ],
        onSelectedItemChanged: (value) async {
          // ignore: avoid_print
          print(value);
          imageFit.setImageFit(imageFit: value == 0 ? 'Filled' : 'Padding');

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          sharedPreferences.setString('fit', value == 0 ? 'Filled' : 'Padding');
        },
      ),
    ),
  );
}

void _showCrossAxisCountPicker(
  BuildContext context,
  SettingProvider settingProvide,
  ColorTheme theme,
) {
  showCupertinoModalPopup(
    context: context,
    builder: (_) => SizedBox(
      height: 250,
      child: CupertinoPicker(
        backgroundColor: theme.backgroundColor,
        itemExtent: 30,
        scrollController: FixedExtentScrollController(
            initialItem: settingProvide.getCrossAxisCount - 2),
        children: [
          Text('2', style: TextStyle(color: theme.textColor)),
          Text('3', style: TextStyle(color: theme.textColor)),
        ],
        onSelectedItemChanged: (value) async {
          // ignore: avoid_print
          print(value);
          settingProvide.setCrossAxisCount(value + 2);

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();

          sharedPreferences.setInt('crossAxisCount', value + 2);
        },
      ),
    ),
  );
}
