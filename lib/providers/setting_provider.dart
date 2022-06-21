import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  String _imageFit = 'Padding';

  String get getImageFit => _imageFit;

  void setImageFit({required String imageFit}) {
    _imageFit = imageFit;
    notifyListeners();
  }

  BoxFit _boxFit = BoxFit.fitWidth;

  BoxFit get getBoxFit => _boxFit;

  void setBoxFit({required BoxFit boxFit}) {
    _boxFit = boxFit;
    notifyListeners();
  }

  String? _imageUrl;

  String? get getImageUrl => _imageUrl;

  void setImageUrl({required String url}) {
    _imageUrl = url;
    notifyListeners();
  }

  void reset() {
    _boxFit = BoxFit.fitWidth;
    _imageUrl = null;
  }
}
