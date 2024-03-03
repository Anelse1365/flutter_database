// TransactionProvider.dart

import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
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
