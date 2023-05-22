import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    _token = 'asdaosdoasdokasodkasodkasodkasodkasd';
    LocalStorage.prefs.setString('token', _token!);
    notifyListeners();
  }
}
