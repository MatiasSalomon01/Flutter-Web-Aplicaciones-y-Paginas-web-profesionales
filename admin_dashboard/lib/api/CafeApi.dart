import 'dart:typed_data';

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

  static Future delete(String path) async {
    try {
      final res = await _dio.delete(path);
      return res.data;
    } catch (e) {
      throw ('Error en el DELETE $e');
    }
  }

  static Future uploadFile(String path, Uint8List bytes) async {
    final formData = FormData.fromMap({
      'archivo': MultipartFile.fromBytes(bytes),
    });
    try {
      final res = await _dio.put(path, data: formData);
      return res.data;
    } catch (e) {
      throw ('Error en el PUT $e');
    }
  }
}
