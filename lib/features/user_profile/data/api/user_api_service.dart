import 'package:codeforces_info/features/user_profile/data/model/contest_model.dart';
import 'package:codeforces_info/features/user_profile/data/model/user_model.dart';

abstract class UserApiService {
  Future<UserModel> getUserInfo(String handle);
  Future<List<ContestModel>> getUserContests(String handle);
}
