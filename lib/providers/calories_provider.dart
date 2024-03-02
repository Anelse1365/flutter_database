import 'package:flutter/material.dart';

class CaloriesProvider extends ChangeNotifier {
  int _totalCalories = 0;

  int get totalCalories => _totalCalories;

  void addCalories(int calories) {
    _totalCalories += calories;
    notifyListeners();
  }

  void clearCalories() {
    _totalCalories = 0;
    notifyListeners();
  }
}
