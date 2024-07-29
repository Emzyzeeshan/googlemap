import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login(String email, String password) {
    // Implement login logic here
    _isLoggedIn = true;

    notifyListeners();
  }
}
