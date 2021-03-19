import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/model/api_model.dart';

final _base = "https://uat.cloudgateway.saint-gobain.com/openam/oauth2";
final _tokenEndpoint = "/access_token?realm=AccessManagement&client_id=POC_RH_IAM_Mobile&client_secret=5lACra3MwukT37ddHwvJ&grant_type=password";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> getToken(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: <String, String>{ "username": userLogin.username,
      "password": userLogin.password,"scope":'mail'},
  );
  if (response.statusCode == 200) {
    print(response.body);
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
