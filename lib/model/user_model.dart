class User {
  int id;
  String username;
  String access_token;

  User(
      {this.id,
      this.username,
      this.access_token});

  factory User.fromDatabaseJson(Map<String, dynamic> data) => User(
      id: data['id'],
      username: data['username'],
    access_token: data['token'],
  );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "username": this.username,
        "token": this.access_token
      };
}
