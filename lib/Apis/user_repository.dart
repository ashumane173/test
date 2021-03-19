import 'dart:async';
import 'package:flutter_app/model/user_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app/model/api_model.dart';
import 'package:flutter_app/Apis/api_connection.dart';

class UserRepository {

  Future<User> authenticate ({
    @required String username,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(
        username: username,
        password: password
    );
    Token token = await getToken(userLogin);
    User user = User(
      id: 0,
      username: username,
      access_token: token.access_token,
    );
    return user;
  }


}
