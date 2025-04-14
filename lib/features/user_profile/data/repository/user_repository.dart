import 'package:dio/dio.dart';
import '../model/user_model.dart';

class UserRepository {
  final Dio _dio;

  UserRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<UserModel> fetchUser(String handle) async {
    try {
      final response = await _dio.get(
        'https://codeforces.com/api/user.info',
        queryParameters: {'handles': handle},
      );

      final data = response.data;
      final userJson = data['result'][0];
      return UserModel.fromJson(userJson);
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }
}
