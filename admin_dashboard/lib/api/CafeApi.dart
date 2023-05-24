import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class CafeApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    _dio.options.baseUrl = "http://localhost:8080/api";
    _dio.options.headers = {
      "x-token": LocalStorage.prefs.getString('token') ?? ''
    };
  }

  static Future httpGet(String path) async {
    try {
      final res = await _dio.get(path);
      return res.data;
    } catch (e) {
      throw ('Error en el GET $e');
    }
  }
}
