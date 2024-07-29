import 'package:flutter/material.dart';
import '../models/user_model.dart';

class LoginController with ChangeNotifier {
  String _email = '';
  String _password = '';
  String? _emailError;
  String? _passwordError;

  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  void updateEmail(String email) {
    _email = email;
    _validateEmail();
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    _validatePassword();
    notifyListeners();
  }

  void _validateEmail() {
    if (_email.isEmpty) {
      _emailError = 'Email cannot be empty';
    } else if (!_email.contains('@')) {
      _emailError = 'Invalid email format';
    } else {
      _emailError = null;
    }
  }

  void _validatePassword() {
    if (_password.isEmpty) {
      _passwordError = 'Password cannot be empty';
    } else if (_password.length < 6) {
      _passwordError = 'Password must be at least 6 characters long';
    } else {
      _passwordError = null;
    }
  }

  bool get isValid => _emailError == null && _passwordError == null;

  UserModel get userModel => UserModel(email: _email, password: _password);
}
