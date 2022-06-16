import 'package:flutter/material.dart';
import 'package:papers/models/models.dart';

class ThemeChangerProvider with ChangeNotifier {
  bool _themeDark = false;
  bool get getThemeDark => _themeDark;

  void setLight() {
    _themeDark = false;
    notifyListeners();
  }

  void setDark() {
    _themeDark = true;
    notifyListeners();
  }

  ColorTheme get getThemeData => _themeDark ? darkTheme : lightTheme;
}

final lightTheme = ColorTheme(
  backgroundColor: const Color(0xFFFAF9F9),
  textColor: Colors.black,
  underTextColor: Colors.grey,
  cardColor: const Color(0xFFF6F6F6),
);

final darkTheme = ColorTheme(
  backgroundColor: const Color(0xFF1E212C),
  textColor: Colors.white,
  underTextColor: const Color(0xFFC8C7C7),
  cardColor: const Color(0xFF313242),
);
