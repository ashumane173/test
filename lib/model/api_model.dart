class UserLogin {
  String username;
  String password;

  UserLogin({this.username, this.password});

  Map <String, dynamic> toDatabaseJson() => {
    "username": this.username,
    "password": this.password
  };
}

class Token{
  String access_token;

  Token({this.access_token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        access_token: json['access_token']
    );
  }
}

