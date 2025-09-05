import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  Future<Map<String, dynamic>> get({required String link}) async {
    final response = await dio.get(link);
    return response.data;
  }
}
