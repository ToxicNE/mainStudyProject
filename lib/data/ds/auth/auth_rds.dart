import 'package:study_msg/data/ds/auth/auth_ds.dart';
import 'package:study_msg/data/models/remote/user/user.dart';

class AuthRDS implements IAuthDS {
  @override
  Future<User> login(String login, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<User> register(String login, String password, String mail) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
