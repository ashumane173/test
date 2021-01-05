import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter_app/util/tblAccount_helper.dart';
import 'package:flutter_app/Menus/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/Pages/ContactUs.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:flutter_app/Pages/MyRequest.dart';
import 'package:flutter_app/Pages/ReturnToWork.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hexcolor/hexcolor.dart';

class NewRequest extends StatefulWidget {


  NewRequest();

  @override
  State<StatefulWidget> createState() {
    return NewRequestdetails();
  }
}

class NewRequestdetails extends State<NewRequest> {

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


  NewRequestdetails();

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
                'Create New Request',
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
                    'Creating New Request for Ashwini Mane',
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
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assests/freelunchbanner1.jpg', height: 60.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              '   Malvern employees are eligible for a free lunch. ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            ),

                          ),

                          Container(

                            color: Colors.white,
                            child: Text(
                              'Click here',
                              style: GoogleFonts.ubuntu(color: HexColor("#337ab7"),fontSize: 18),
                            ),
                            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0, right: 15.0,top: 10.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              ' to learn more about it.',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            ),

                          ),

                        ],
                      ),
                    ),
                  ),
                ],
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
                  'To help us manage appropriate social distancing, please note that all your requests will be sent to the Facilities Managers for approval. You will be notified via email when your request has been processed. Your manager will receive an acknowledgment message informing them of your request.',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              height: 220,
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
                  'If you do not see a timeslot listed in a selected date, it means that the date/timeslot you selected is not available. Bookings now cover the entire day.',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

                ),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              height: 140,
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
                  'Location:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

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
                  'Building:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

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
                  'Floor Number:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

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
                  'Seat Location:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

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
                  'Select Days:',
                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),

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
                  color: Colors.white,
                  child: Container(
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          color: Colors.white,
                          child: Checkbox(
                            value: false,
                            onChanged: (bool value) {

                            },
                          ),
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              '  Mon, Dec 21, 2020  ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            )
                        ),
                      ]))),
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
                  color: Colors.white,
                  child: Container(
                      child: Row(children: <Widget>[
                        Container(

                          color: Colors.white,
                          child: Checkbox(
                            value: false,
                            onChanged: (bool value) {

                            },
                          ),
                        ),

                        Container(

                            color: Colors.white,
                            child: Text(
                              '  Tue, Dec 22, 2020  ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            )
                        ),
                      ]))),
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
                  color: Colors.white,
                  child: Container(
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0, right: 15.0,top: 20.0, bottom: 10.0),
                          color: Colors.orangeAccent,
                          child: Text(
                            'Unavailable',
                            style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 16),

                          ),

                        ),

                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              '  Wed, Dec 23, 2020  ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            )
                        ),
                      ]))),
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
                  color: Colors.white,
                  child: Container(
                      child: Row(children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15.0, right: 15.0,top: 20.0, bottom: 10.0),
                          color: Colors.orangeAccent,
                          child: Text(
                            'Unavailable',
                            style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 16),

                          ),
                        ),

                        Container(
                            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              '  Thu, Dec 24, 2020  ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            )
                        ),
                      ]))),
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
                  color: Colors.white,
                  child: Container(
                      child: Row(children: <Widget>[
                        Container(

                          color: Colors.white,
                          child: Checkbox(
                            value: false,
                            onChanged: (bool value) {

                            },
                          ),
                        ),

                        Container(

                            color: Colors.white,
                            child: Text(
                              '  Fri, Dec 25, 2020  ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            )
                        ),
                      ]))),
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
                  color: Colors.white,
                  child: Container(
                      child: Row(children: <Widget>[
                        Container(

                          color: Colors.white,
                          child: Checkbox(
                            value: false,
                            onChanged: (bool value) {

                            },
                          ),
                        ),

                        Container(

                            color: Colors.white,
                            child: Text(
                              '  Sat, Dec 26, 2020  ',
                              style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 18),
                            )
                        ),
                      ]))),
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
                  child: Text('Submit Request', style: GoogleFonts.ubuntu(fontSize: 18)),
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


