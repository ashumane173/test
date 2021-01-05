import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:flutter/material.dart';

class Footerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: Card(
          child:Padding(
              padding: new EdgeInsets.all(10.0),
              child: Text('I am a Customizable footer!!')
          ),
        )
    );
  }
}