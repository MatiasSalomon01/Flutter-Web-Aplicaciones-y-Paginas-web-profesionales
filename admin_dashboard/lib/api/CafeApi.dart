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

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final res = await _dio.post(path, data: formData);
      return res.data;
    } catch (e) {
      throw ('Error en el POST $e');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final res = await _dio.put(path, data: formData);
      return res.data;
    } catch (e) {
      throw ('Error en el PUT $e');
    }
  }
}
