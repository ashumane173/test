import 'package:flutter/material.dart';
import 'package:flutter_app/screens/note_list.dart';
import 'package:flutter_app/screens/note_detail.dart';
import 'package:flutter_app/Menus/navdrawer.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // title: 'Flutter Demo',
     // theme: ThemeData(
     //   primarySwatch: Colors.blue,
     // ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
   //   appBar: AppBar(
   //     title: Text('App Demo'),
    //  ),
      body: MyAccount(null),

    );
  }
}
