import '../api/userApi.dart';
import '../models/userModel.dart';

class UserRepository {
  Future<bool> resgisterUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> login(String email, String password) {
    return UserAPI().login(email, password);
  }
}
