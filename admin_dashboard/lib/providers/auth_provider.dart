import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    //TODO: Peticion HTTP
    _token = 'asdaosdoasdokasodkasodkasodkasodkasd';
    print('alamcenar JWT: $_token');

    //TODO: Navegat el Dashboard
    notifyListeners();
  }
}
