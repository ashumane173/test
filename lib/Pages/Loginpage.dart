import 'package:flutter/material.dart';
import 'package:flutter_app/Apis/user_repository.dart';
import 'package:flutter_app/model/user_model.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:flutter_session/flutter_session.dart';
class LoginPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => new _State();

}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    dynamic token =  FlutterSession().get("token");
    print(token);
    if (token == '') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAccount(null)),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Campus Return',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter SGID',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text(''),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () {
                          String username;
                        UserRepository().authenticate(username: nameController.text, password: passwordController.text)
                            .then((value) async {username=value.access_token;
                        var session = FlutterSession();
                        await session.set("token", username);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyAccount(null)),
                        );
                            });

                        print(nameController.text);
                        print(passwordController.text);
                      },
                    )),

              ],
            )));
  }
}