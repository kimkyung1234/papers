import 'package:flutter/material.dart';
import 'package:papers/services/photo_api.dart';

class PageCountProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get getCurrentIndex => _currentIndex;

  void onTabTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  /// list lazy loading

  PhotoApiHelper photoApiHelper = PhotoApiHelper();

  List<dynamic> _postList = [];
  List<dynamic> get getPostList => _postList;

  int _index = 1;
  int get getIndex => _index;

  bool _isFirstLoadRunning = true;

  Future<void> firstLoad() async {
    if (_isFirstLoadRunning == true) {
      var a = await photoApiHelper.getRandomPhotos(page: 1);
      _postList = a.photos!;

      _isFirstLoadRunning = false;
      _index++;
      notifyListeners();
    }
  }

  Future<void> loadMore() async {
    if (_isFirstLoadRunning == false) {
      var a = await photoApiHelper.getRandomPhotos(page: _index);
      _postList.addAll(a.photos!);
      _index++;
      notifyListeners();
    }
  }
}
