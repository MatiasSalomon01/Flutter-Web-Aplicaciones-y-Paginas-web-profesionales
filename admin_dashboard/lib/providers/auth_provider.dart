import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    _token = 'asdaosdoasdokasodkasodkasodkasodkasd';
    LocalStorage.prefs.setString('token', _token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {
    final data = {"nombre": name, "correo": email, "password": password};

    CafeApi.post('/usuarios', data).then((json) => print(json)).catchError((e) {
      print('Error en: $e');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // await Future.delayed(const Duration(milliseconds: 100));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
