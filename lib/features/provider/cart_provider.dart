import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];

  void addItem(Map<String, dynamic> item) {
    cart.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    cart.removeAt(index);
    notifyListeners();
  }

  int get totalItem => cart.length;

    int get totalHarga {
        int total = 0;
        for (var item in cart) {
          int harga = item["harga"] ?? 0;
    int qty = item["qty"] ?? 0;

total += harga * qty;
    }
    return total;
  }
}