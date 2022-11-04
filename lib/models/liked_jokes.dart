import 'package:flutter/material.dart';

class ShoppingCart with ChangeNotifier {
  List<String> _jokes = ['Buration can not swim'];

  int get count => _jokes.length;
  List<String> get cart => _jokes;

  void addItem(String item) {
    _jokes.add(item);
    notifyListeners();
  }
}