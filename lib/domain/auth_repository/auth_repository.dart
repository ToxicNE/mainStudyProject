import 'package:study_msg/data/ds/auth/auth_ds.dart';
import 'package:study_msg/data/models/remote/user/user.dart';

class AuthRepository {
  AuthRepository(
    this._dataSource,
  );
  final IAuthDS _dataSource;

  Future<User> register(String login, String password, String mail) async {
    try {
      final res = await _dataSource.register(login, password, mail);
      return res;
    } on Object {
      rethrow;
    }
  }

  Future<User> login(String login, String password) async {
    try {
      final res = await _dataSource.login(login, password);
      return res;
    } on Object {
      rethrow;
    }
  }
}
