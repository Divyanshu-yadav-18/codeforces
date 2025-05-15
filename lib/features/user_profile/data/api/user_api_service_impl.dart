import 'package:dio/dio.dart';
import 'user_api_service.dart';
import '../model/user_model.dart';
import '../model/contest_model.dart';

class UserApiServiceImpl implements UserApiService {
  final Dio dio;

  UserApiServiceImpl(this.dio);

  @override
  Future<UserModel> getUserInfo(String handle) async {
    final response = await dio.get(
      '/user.info',
      queryParameters: {'handle': handle},
    );
    return UserModel.fromJson(response.data['result'][0]);
  }

  @override
  Future<List<ContestModel>> getUserContests(String handle) async {
    final response = await dio.get(
      '/user.rating',
      queryParameters: {'handle': handle},
    );
    final result = response.data['result'] as List;
    return result.map((e) => ContestModel.fromJson(e)).toList();
  }
}
