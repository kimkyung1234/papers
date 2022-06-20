import 'package:flutter/material.dart';

class SettingProvider with ChangeNotifier {
  String _imageFit = 'Padding';

  String get getImageFit => _imageFit;

  void setImageFit({required String imageFit}) {
    _imageFit = imageFit;
    notifyListeners();
  }
}
