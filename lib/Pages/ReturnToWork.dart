import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter_app/util/tblAccount_helper.dart';
import 'package:flutter_app/Menus/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/Pages/ContactUs.dart';
import 'package:flutter_app/Pages/NewRequest.dart';
import 'package:flutter_app/Pages/MyRequest.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hexcolor/hexcolor.dart';

class ReturnToWork extends StatefulWidget {


  ReturnToWork();

  @override
  State<StatefulWidget> createState() {
    return ReturnToWorkdetails();
  }
}


class ReturnToWorkdetails extends State<ReturnToWork> {

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

  ReturnToWorkdetails();

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
                'Return to Work Process',
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: HexColor("#fcf8e3"),
                ),
                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 30.0),
                          child: Text('Step 1: Read the Return to Office Guide',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Text(
                              'With the initial volunteer phase (Wave 1) of return to office approaching, we wanted to provide clear guidance so employees know exactly what to expect when they return to the Malvern campus.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        Container(
                            margin: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15.0),
                            child: Text(
                                'Download the Return to Office Guide for Malvern HQ Building',
                                style: GoogleFonts.ubuntu(
                                  color: Colors.blue,
                                  fontSize: 18,
                                )))
                      ],
                    )),
                margin:
                const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              //   margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: HexColor("#d9edf7"),
                ),
                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 30.0),
                          child: Text(
                              'Step 2: Watch Our Virtual Walkthrough Video "A Day in the Life of Malvern 2.0"',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Text(
                              'Not sure what to expect? Do not worry! Watch this video for a virtual walkthrough of the protocol and steps that will need to be taken to ensure we are safe when returning to the building.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                      ],
                    )),
                margin:
                const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
              ),
              // margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                  color:HexColor("#dff0d8") ,
                ),

                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 30.0),
                          child: Text(
                              'Step 3: Sign Up to Book Your Space For the Malvern HQ Building ONLY',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                              'In Wave 1, employees will self-select to volunteer to return to the workplace.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Text(
                              'All employees interested in volunteering to return to the building during Wave 1 should click here to book their workspace in the office.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Text('Bookings now cover the entire day.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Text(
                              'For questions, please use the Contact Us feature.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                      ],
                    )),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              //    margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                  color:HexColor("#f2dede") ,
                ),

                child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 30.0),
                          child: Text(
                              'Step 4: Fill Out Temperature Screening Consent Form',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                              'All employees who request to return to Malvern will need to sign a Temperature Screening Consent Form.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 10.0),
                          child: Text('The forms can be signed electronically by visitng the My Account page and completing the Temperature Screening Consent Form section.',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black, fontSize: 18)),
                        ),

                      ],
                    )),
                margin: const EdgeInsets.only(left: 15.0, right: 15.0,top:15.0),
              ),
              //  margin: const EdgeInsets.only(left: 15.0, right: 15.0),
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
              margin: const EdgeInsets.only(top:30.0),
            )

          ])
        ]));
  }

}
