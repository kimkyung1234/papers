import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String? _inputText;

  String? get getInputText => _inputText;

  void setText(String text) {
    print('set: $text');
    _inputText = text;
    notifyListeners();
  }
}
