import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;

  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final res = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromJson(res);
    users = [...usersResponse.usuarios];
    isLoading = false;
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort(
      (a, b) {
        final aValue = getField(a);
        final bValue = getField(b);

        return Comparable.compare(aValue, bValue);
      },
    );
    notifyListeners();
  }
}
