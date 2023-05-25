import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/http/categories_response.dart';
import 'package:admin_dashboard/models/http/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final res = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromJson(res);
    categorias = [...categoriesResponse.categorias];
    notifyListeners();
  }
}
