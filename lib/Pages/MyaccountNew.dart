import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter_app/util/tblAccount_helper.dart';
import 'package:flutter_app/Menus/navdrawer.dart';

import 'package:sqflite/sqflite.dart';
class MyAccountLocation extends StatefulWidget {
  final int numPlayers;
  MyAccountLocation({this.numPlayers});

  @override
  _MyAccountLocationList createState() => _MyAccountLocationList();
}

class _MyAccountLocationList extends State<MyAccountLocation> {
  int dropDownValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      child: DropdownButton(
        value: dropDownValue,
        onChanged: (int newVal){
          setState(() {
            dropDownValue = newVal;
          });
        },
        items: [
          DropdownMenuItem(
            value: 0,
            child: Text('Malvern Campus'),
          ),
          DropdownMenuItem(
            value: 1,
            child: Text('Mississauga Campus'),
          ),
        ],
      ),
    )
    );
  }
}
class MyAccount extends StatefulWidget {
  final tblAccount empd;

  MyAccount(this.empd);

  @override
  State<StatefulWidget> createState() {
    return MyAccountdetails(this.empd);
  }
}

tblAccount_helper databaseHelper = tblAccount_helper();

final Future<Database> dbFuture = databaseHelper.initializeDatabase();

class MyAccountdetails extends State<MyAccount> {
  String fullName = '';
  List<tblAccount> EmpDetails;

  tblAccount empd;

  MyAccountdetails(this.empd);

  @override
  Widget build(BuildContext context) {
    _save();
    debugPrint("in 1");
    tblAccount_helper databaseHelper = tblAccount_helper();

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();

    if (EmpDetails == null) {
      debugPrint("int 2");
      EmpDetails = List<tblAccount>();
      updateListView();
    }

    return Scaffold(

      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            Container(
                color: Color(0xFFFF0000), // color
                padding: const EdgeInsets.all(12),
                child: Text(
                  '## UAT ##  -- ALL DATA WILL EVENTUALLY BE ERASED -- NO EMAILS ARE SENT TO ACTUAL RECIPIENTS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                )
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, bottom: 15, right: 10),
              decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  border: Border(
                    left: BorderSide( //                   <--- left side
                      color: Colors.black,
                      width: 1,
                    ),
                    right: BorderSide( //                    <--- top side
                      color: Colors.black,
                      width: 1,
                    ),
                  )
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 60,
                    child:
                    Text('Welcome, Ashwini Mane',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Text('11/12/2020',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),),
                  )
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, bottom: 15, right: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    left: BorderSide( //                   <--- left side
                      color: Colors.black,
                      width: 0,
                    ),
                    right: BorderSide( //                    <--- top side
                      color: Colors.black,
                      width: 0,
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assests/sg-logo-white.png', height: 60.0,
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.white, size: 40),
                      onPressed: () {
                        drawer:NavDrawer();
                      },
                    ),
                  ),
                ],

              ),
            ),
            Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 10, bottom: 20, right: 10),
                decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide( //                   <--- left side
                        color: Colors.black,
                        width: 0,
                      ),
                      right: BorderSide( //                    <--- top side
                        color: Colors.black,
                        width: 0,
                      ),
                    )),
                child: Text(
                  'My Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 35),

                )
            ),

            Container(
                margin: const EdgeInsets.only(
                    top: 0, left: 20, bottom: 0, right: 20),
                padding: const EdgeInsets.only(
                    top: 15, left: 15, bottom: 15, right: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFE6E6E6),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Ashwini Mane's Account Information",
                      style: new TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),


                  ],
                )
            ),

            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 0, right: 20),
                  alignment: Alignment.centerLeft,
                  // where to position the child
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("SGI:",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text("A9548993",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 0, right: 20),
                  alignment: Alignment.centerLeft,
                  // where to position the child
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Name:",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text("Ashwini Mane",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 0, right: 20),
                  alignment: Alignment.centerLeft,
                  // where to position the child
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Email Address:",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text("Ashwini.Mane@ext.saint-gobain.com",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 0, right: 20),
                  alignment: Alignment.centerLeft,
                  // where to position the child
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Position:",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text("SGNA-IT",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 0, right: 20),
                  alignment: Alignment.centerLeft,
                  // where to position the child
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("My Direct Manager:",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      Text("Eric Marcussen (E3028542)",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),


                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 0, right: 20),
                  alignment: Alignment.centerLeft,
                  // where to position the child
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Text("Location:",
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                      MyAccountLocation(),

                    ],
                  ),
                  // child: PlayerPreferences(),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 25, left: 15, bottom: 0, right: 15),
                  margin: const EdgeInsets.only(
                      top: 0, left: 20, bottom: 30, right: 20),
                  alignment: Alignment.centerLeft, // Page End bar
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        left: BorderSide( //                   <--- left side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        right: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                        bottom: BorderSide( //                    <--- top side
                          color: Color(0xFFE6E6E6),
                          width: 1,
                        ),
                      )
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  void updateListView() {
    debugPrint("int 3");
    tblAccount_helper databaseHelper = tblAccount_helper();
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      debugPrint("int 3");
      Future<List<tblAccount>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        debugPrint("int 4");
        setState(() {
          this.EmpDetails = noteList;
          debugPrint(this.EmpDetails[0].sgi);
        });
      });
    });
  }

  void _save() async {
    debugPrint("in save");
    empd = tblAccount('', '', '', '', '', '');
    empd.sgi = "A9548993";
    empd.phone = "9548993";
    empd.email = "abc@ext.com";
    empd.firstName = "Ashwini";
    empd.lastName = "Mane";
    empd.position = "Software devloper";
    int result;

    result = await databaseHelper.insertNote(empd);
    debugPrint(result.toString());
  }

}

void _onSearchButtonPressed() {
  print("search button clicked");
}