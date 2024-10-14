import 'package:study_msg/data/models/remote/user/user.dart';

abstract interface class IAuthDS {
  Future<User> login(String login, String password);

  Future<User> register(String login, String password, String mail);
}
