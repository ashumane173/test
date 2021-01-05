import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter_app/util/tblAccount_helper.dart';
import 'package:flutter_app/Menus/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:flutter_app/Pages/NewRequest.dart';
import 'package:flutter_app/Pages/MyRequest.dart';
import 'package:flutter_app/Pages/ReturnToWork.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactUs  extends StatefulWidget {


  ContactUs ();

  @override
  State<StatefulWidget> createState() {
    return ContactUsdetails();
  }
}


final Future<Database> dbFuture = databaseHelper.initializeDatabase();

class ContactUsdetails extends State<ContactUs> {
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


  ContactUsdetails();

  @override
  Widget build(BuildContext context) {

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
                'Contact Us',
                style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 48),

              ),
              color: Colors.white,
              padding: EdgeInsets.all(25),

              width: 380,
            ),
            Container(
              decoration:BoxDecoration(
                border: Border(
                  left: BorderSide( //                   <--- left side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  top: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                  bottom: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 2.0,
                  ),
                  right: BorderSide( //                    <--- top side
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                color: HexColor("#f5f5f5"),
              ),
              child:  Padding(
                  padding: EdgeInsets.all(10.0),
                  child:Text(
                    'Please complete all fields below.',
                    style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                  )),
              height: 50,
              width: 380,
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color:HexColor("#d9edf7") ,
                ),

                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child:Text(
                      'Do not submit requests to come into a Saint-Gobain facility on this form.  All requests to come to a Saint-Gobain facility must be submitted using the New Request form',
                      style: GoogleFonts.ubuntu(color: HexColor("#31708f"),fontSize: 18),

                    )),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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

                child: Text(
                  'Location:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 16),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),

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

                child: Text(
                  'Malvern Campus',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 16),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),

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

                child: Text(
                  'Message Type',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 16),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              height: 50,
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
                    hint:  Text("Select Type"),
                    items: <String>['Technical/Site Functionality Issue', 'Facilities Question','Other'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {}
                ),margin: const EdgeInsets.only(left: 15.0, right: 15.0),),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                    'Message/Comments',
                    style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 16)

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              height: 50,
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

              child:Container(decoration:BoxDecoration(
                  color:Colors.white ,
                  border: Border.all(
                    color: Colors.black,
                    //                   <--- border color
                    width: 1.0,
                  )), child: Padding(

                padding: EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 8,
                  decoration: InputDecoration.collapsed(hintText: "Enter your message here"),

                ),

              ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                  child: Text('Submit Form', style: GoogleFonts.ubuntu(fontSize: 18)),
                  color: HexColor("#337ab7"),
                  textColor: Colors.white,
                  onPressed: () {},
                ),

                margin: const EdgeInsets.only(left: 15.0, right: 130.0,top:15.0,bottom: 40.0),
              ),
              height: 100,
              width: 380,
              margin: const EdgeInsets.only(left: 15.0, right: 15.0,bottom: 20.0),
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
          ],
          )]),

    );
  }
}
