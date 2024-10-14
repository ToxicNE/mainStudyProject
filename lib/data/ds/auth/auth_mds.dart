import 'package:dio/dio.dart';
import 'package:study_msg/data/ds/auth/auth_ds.dart';
import 'package:study_msg/data/models/remote/user/user.dart';

class AuthMDS implements IAuthDS {
  
  @override
  Future<User> login(String login, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (login == 'admin' && password == '1234Qwerty') {
      return User(
        id: '1',
        login: 'admin',
        email: 'admin',
      );
    }

    if (login == 'tuka' && password == '1234Qwerty') {
      return User(
        id: '2',
        login: 'tuka',
        email: 'tuka',
      );
    }

    throw DioException(
      requestOptions: RequestOptions(path: '/login'),
      response: Response(
        statusCode: 401,
        requestOptions: RequestOptions(path: '/login'),
        data: {
          'message': 'Wrong login or password',
        },
      ),
    );
  }

  @override
  Future<User> register(String login, String password, String mail) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
