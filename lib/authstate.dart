import 'package:flutter/material.dart';

class AuthState extends ChangeNotifier {
  bool _isLoggedIn = false;
  String? _userId;
  String? _accessToken;

  bool get isLoggedIn => _isLoggedIn;
  String? get userId => _userId;
  String? get accessToken => _accessToken;

  void login(String userId, String accessToken) {
    _isLoggedIn = true;
    _userId = userId;
    _accessToken = accessToken;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userId = null;
    _accessToken = null;
    notifyListeners();
  }
}