import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter_app/util/tblAccount_helper.dart';
import 'package:flutter_app/Menus/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/Pages/ContactUs.dart';
import 'package:flutter_app/Pages/NewRequest.dart';
import 'package:flutter_app/Pages/MyRequest.dart';
import 'package:flutter_app/Pages/ReturnToWork.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hexcolor/hexcolor.dart';

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
  bool viewVisible = false ;

  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;
    });
  }
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
        drawer: NavDrawer(),
        // appBar: AppBar(
        //   title: Text("My Account",style: TextStyle(color: Colors.white),),
        //  backgroundColor: Colors.black,
        // ),
        body: ListView(shrinkWrap: true, children: <Widget>[
          Column(children: <Widget>[
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
                )),
            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, bottom: 15, right: 10),
              decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  border: Border(
                    left: BorderSide(
                      //                   <--- left side
                      color: Colors.black,
                      width: 1,
                    ),
                    right: BorderSide(
                      //                    <--- top side
                      color: Colors.black,
                      width: 1,
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 60,
                    child: Text(
                      'Welcome, Ashwini Mane',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: Text(
                      '11/12/2020',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
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
                    left: BorderSide(
                      //                   <--- left side
                      color: Colors.black,
                      width: 0,
                    ),
                    right: BorderSide(
                      //                    <--- top side
                      color: Colors.black,
                      width: 0,
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assests/sg-logo-white.png',
                    height: 60.0,
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.menu, color: Colors.white, size: 40),
                      onPressed: () {
                        debugPrint(viewVisible.toString());
                        if(viewVisible==false)
                          {
                            debugPrint('in if');
                            showWidget();
                          }
                        else
                          {
                            debugPrint('in else');
                            hideWidget();
                          }

                      },
                    ),
                  ),


                ],
              ),
            ),
    Visibility( visible: viewVisible,child:Container(

              padding: const EdgeInsets.only(
                  top: 15, left: 10, bottom: 15, right: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    left: BorderSide(
                      //                   <--- left side
                      color: Colors.black,
                      width: 0,
                    ),
                    right: BorderSide(
                      //                    <--- top side
                      color: Colors.black,
                      width: 0,
                    ),
                  )),


                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    children: <Widget>[

                      ListTile(

                        title: Text('My Account',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 18),),
                        onTap: () => { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyAccount(null)),
                        )  },
                      ),
                      ListTile(

                        title: Text('Return To Work Process',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 18),),
                        onTap: () => { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReturnToWork()),
                        ) },
                      ),
                      ListTile(

                        title: Text('New Request', style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 18),),
                        onTap: () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewRequest()),
                        ) },
                      ),
                      ListTile(

                        title: Text('My Requests',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 18),),
                        onTap: () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyRequest()),
                        )},
                      ),
                      ListTile(

                        title: Text('Contact Us',style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 18),),
                        onTap: () => {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContactUs()),
                        )  },
                      ),
                    ],
                  ),
            )),
            Container(
              child: Text(
                'My Account',
                style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 48),
              ),
              color: Colors.white,
              padding: EdgeInsets.all(25),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: HexColor('#faebcc'),
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: HexColor('#faebcc'),
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: HexColor("#fcf8e3"),
                ),
                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: 'Missing Info!',
                              style: GoogleFonts.ubuntu(
                                  color: HexColor('#8a6d3b'),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          new TextSpan(
                              text:
                                  ' It appears office location information is missing from your account.  You must complete this information before you can submit requests for campus entry. All fields are required.',
                              style: GoogleFonts.ubuntu(
                                  color: HexColor('#8a6d3b'), fontSize: 18)),
                        ],
                      ),
                    )),
                margin: const EdgeInsets.only(top: 10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  top: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 2.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: HexColor("#f5f5f5"),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Ashwini Mane Account Information',
                    style:
                        GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                  )),
              height: 50,
              width: 380,
              margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 25.0),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'SGI:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  this.EmpDetails[0].sgi,
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Name:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Ashwini Mane',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Email Address:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  this.EmpDetails[0].email,
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Position:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'SGNA-IT',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'My Direct Manager:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Eric Marcussen (E3028542) ',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Date Added:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  '09/24/2020',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Last Updated:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  '12/09/2020 ',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Temperature Screening Consent Form:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Download a copy of the uploaded form',
                  style: GoogleFonts.ubuntu(
                      color: HexColor('#337ab7'), fontSize: 18),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Phone Number:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                height: 40,
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide(
                    //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(
                child: Text(
                  'Office Location:',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                ),
                margin:
                const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: 380,
            ),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(

                child:DropdownButton<String>(
                    hint:  Text("Select Location"),
                    items: <String>['Malvern Campus', 'Mississauga Campus'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {}
                ),margin: const EdgeInsets.only(left: 15.0, right: 15.0),),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              height: 50,
              width: 380,),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(

                child: Text(
                  'Building:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),

              width: 380,
            ),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(

                child:DropdownButton<String>(
                    hint:  Text("Select building"),
                    items: <String>['Malvern HQ', 'Malvern Innovation Center (MIC)'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {}
                ),margin: const EdgeInsets.only(left: 15.0, right: 15.0),),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              height: 50,
              width: 380,),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(

                child: Text(
                  'Floor Number:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),

              width: 380,
            ),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(

                child:DropdownButton<String>(
                    hint:  Text("Select floor"),
                    items: <String>['1', '2','3'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {}
                ),margin: const EdgeInsets.only(left: 15.0, right: 15.0),),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              height: 50,
              width: 380,),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Container(

                child: Text(
                  'Seat Location:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),

              width: 380,
            ),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),

                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0),
                            color: Colors.white,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: ''
                              ),
                            ),
                            height: 40,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15.0, right: 15.0),
                              color: Colors.white,
                              child: Text(
                                '(Find your seat location)',
                                style: GoogleFonts.ubuntu(color: HexColor("#337ab7"),fontSize: 18),
                              )
                          ),
                            ],
                      ),
                    ),
                  ),
                ],
              ),
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),

              width: 380,
            ),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color:Colors.black,
                    width: 1.0,
                  ),
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: Colors.white,
              ),
              child:Container(

                child: FlatButton(
                  child: Text('Submit Changes', style: GoogleFonts.ubuntu(fontSize: 18)),
                  color: HexColor("#337ab7"),
                  textColor: Colors.white,
                  onPressed: () {},
                ),

                margin: const EdgeInsets.only(left: 15.0, right: 130.0,top:15.0,bottom: 40.0),
              ),
              height: 100,
              width: 380,
              margin: const EdgeInsets.only(left: 5.0, right: 5.0,bottom: 20.0),
            ),
            Container(
              color: HexColor("#5b5b5b"),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child: Text('Home Page',style:GoogleFonts.ubuntu(color: HexColor("#ffffff"),fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child: Text('Return To Work Process',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('New Request',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('My Requests',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Free Lunch Offer',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Contact Us',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Mobile Support',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('My Account',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Saint-Gobain',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Certainteed',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Legal Information',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10.0),
                    child:Text('Copyright ©2020. All Rights Reserved',style:GoogleFonts.ubuntu(color: Colors.white,fontSize: 16)),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:15.0,right: 170.0,bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        Image.asset('assests/sg-logo-white.png'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ])
        ]));
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
