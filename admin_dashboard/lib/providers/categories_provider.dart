import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/models/http/category.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final res = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromJson(res);
    categorias = [...categoriesResponse.categorias];
    notifyListeners();
  }

  Future newCategory(String name) async {
    final data = {"nombre": name};
    try {
      final json = await CafeApi.post('/categorias', data);
      final newCategory = Categoria.fromJson(json);
      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      NotificationService.showSnackbarError('Error al crear categoria: $e');
    }
  }

  Future updateCategory(String id, String name) async {
    final data = {"nombre": name};
    try {
      await CafeApi.put('/categorias/$id', data);

      categorias = categorias.map((category) {
        if (category.id != id) return category;
        category.nombre = name;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      NotificationService.showSnackbarError(
          'Error al actualizar categoria: $e');
    }
  }

  Future deleteCategory(String id) async {
    try {
      await CafeApi.delete('/categorias/$id');

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      NotificationService.showSnackbarError('Error al eliminar categoria: $e');
    }
  }
}
