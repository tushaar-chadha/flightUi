import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void set currentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
