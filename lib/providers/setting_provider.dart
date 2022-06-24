import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  String _imageFit = 'Padding';

  String get getImageFit => _imageFit;

  void setImageFit({required String imageFit}) {
    _imageFit = imageFit;
    notifyListeners();
  }

  Future<void> fit() async {
    final prefs = await SharedPreferences.getInstance();
    _imageFit = prefs.getString('fit') ?? 'Padding';
  }

  BoxFit _boxFit = BoxFit.contain;

  BoxFit get getBoxFit => _boxFit;

  void setBoxFit({required BoxFit boxFit}) {
    _boxFit = boxFit;
    notifyListeners();
  }

  // about image url type

  String? _imageUrl;
  String _type = 'medium';

  String? get getImageUrl => _imageUrl;
  String get getType => _type;

  void setImageUrl({required String url, required String type}) {
    _imageUrl = url;
    _type = type;
    notifyListeners();
  }

  void reset() {
    _boxFit = BoxFit.fitWidth;
    _imageUrl = null;
  }

  // about cross axis count

  int _crossAxisCount = 3;

  int get getCrossAxisCount => _crossAxisCount;

  void setCrossAxisCount(int crossAxisCount) {
    _crossAxisCount = crossAxisCount;
    notifyListeners();
  }

  Future<void> crossAxisCount() async {
    final prefs = await SharedPreferences.getInstance();
    _crossAxisCount = prefs.getInt('crossAxisCount') ?? 3;
  }
}
