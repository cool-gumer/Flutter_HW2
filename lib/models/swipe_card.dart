import 'package:flutter/material.dart';

class JokesCart with ChangeNotifier {
    List<String> _Cart = ["Buratino can not swim"];

    int get count => _Cart.length;
    List<String> get cart => _Cart;

    void addItem(String item) {
        _Cart.add(item);
        notifyListeners();
    }
}