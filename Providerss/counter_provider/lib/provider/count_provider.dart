import 'package:flutter/material.dart';

//Todo: CounterProvider
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  //Todo: increment: Tang
  void incremment() {
    _count++;
    notifyListeners();
  }

  //Todo: decrement: Giam
  void decrement() {
    _count -= 1;
    notifyListeners();
  }
}
