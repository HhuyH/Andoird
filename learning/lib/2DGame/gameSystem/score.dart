import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void increment() {
    _score++;

    notifyListeners(); // Thông báo thay đổi để UI cập nhật
  }

  void reset() {
    _score = 0;
    notifyListeners();
  }
}
