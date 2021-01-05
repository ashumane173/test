import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/model/tblAccount.dart';
import 'package:flutter_app/util/tblAccount_helper.dart';
import 'package:flutter_app/Menus/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/Pages/ContactUs.dart';
import 'package:flutter_app/Pages/NewRequest.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:flutter_app/Pages/ReturnToWork.dart';
import 'package:sqflite/sqflite.dart';
import 'package:hexcolor/hexcolor.dart';

class MyRequest extends StatefulWidget {
  MyRequest();

  @override
  State<StatefulWidget> createState() {
    return MyRequestdetails();
  }
}


class MyRequestdetails extends State<MyRequest> {
  bool viewVisible = false;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  tblAccount empd;

  MyRequestdetails();

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
                        if (viewVisible == false) {
                          debugPrint('in if');
                          showWidget();
                        }
                        else {
                          debugPrint('in else');
                          hideWidget();
                        }
                      },
                    ),
                  ),


                ],
              ),
            ),
            Visibility(visible: viewVisible, child: Container(

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

                    title: Text(
                      'My Account', style: GoogleFonts.ubuntu(color: Colors
                        .white, fontSize: 18),),
                    onTap: () =>
                    { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyAccount(null)),
                    )},
                  ),
                  ListTile(

                    title: Text('Return To Work Process',
                      style: GoogleFonts.ubuntu(color: Colors.white,
                          fontSize: 18),),
                    onTap: () =>
                    { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReturnToWork()),
                    )},
                  ),
                  ListTile(

                    title: Text(
                      'New Request', style: GoogleFonts.ubuntu(color: Colors
                        .white, fontSize: 18),),
                    onTap: () =>
                    {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewRequest()),
                    )},
                  ),
                  ListTile(

                    title: Text(
                      'My Requests', style: GoogleFonts.ubuntu(color: Colors
                        .white, fontSize: 18),),
                    onTap: () =>
                    {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyRequest()),
                    )},
                  ),
                  ListTile(

                    title: Text(
                      'Contact Us', style: GoogleFonts.ubuntu(color: Colors
                        .white, fontSize: 18),),
                    onTap: () =>
                    {Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    )},
                  ),
                ],
              ),
            )),
            Container(
              child: Text(
                'My Requests',
                style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 48),

              ),
              color: Colors.white,
              padding: EdgeInsets.all(25),

              width: 380,
            ),
            Container(
                color: Colors.white,
                child: Text(
                  'This section summarizes the status of your requests to work from the office in Saint-Gobain facility.',
                  style: GoogleFonts.ubuntu(color: Colors.black, fontSize: 18),
                )
            ),
            Container(
                color: Colors.white,
                child: Container(
                    child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              color: Colors.white,
                              child: Text(
                                'Showing Future Dates |',
                                style: GoogleFonts.ubuntu(color: Colors.black,
                                    fontSize: 18),
                              )
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              color: Colors.white,
                              child: Text(
                                'Show All Entries',
                                style: GoogleFonts.ubuntu(color: HexColor(
                                    "#337ab7"), fontSize: 18),
                              )
                          ),

                        ]))
            ),
            Container(
                color: Colors.white,
                child: Container(
                    child: Row(children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          color: Colors.white,
                          child: Text(
                            'Show',
                            style: GoogleFonts.ubuntu(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          color: Colors.white,
                          child: DropdownButton<String>(
                              items: <String>['10', '25', '50', '100'].map((
                                  String value) {
                                return new DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {}
                          )
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          color: Colors.white,
                          child: Text(
                            'entries',
                            style: GoogleFonts.ubuntu(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                      ),
                    ]))),
            Container(
                color: Colors.white,
                child: Container(
                    child: Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              color: Colors.white,
                              child: Text(
                                'Search:',
                                style: GoogleFonts.ubuntu(color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                          ),
                          Container(
                              height: 50,
                              width: 200,
                              child: new Theme(
                                  data: new ThemeData(
                                    primaryColor: Colors.black,
                                    primaryColorDark: Colors.black,
                                  ),
                                  child: TextFormField(

                                    maxLength: 20,
                                    decoration: InputDecoration(

                                      border: OutlineInputBorder(),
                                    ),
                                  )
                              )

                          )
                        ]))
            ),
            IntrinsicWidth(
                child: Stack(
                  children: [
                    Container(
                      height: 60, // default would be kMinInteractiveDimension
                      color: Colors.white,
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                        DataTable(

                          columns: [

                            DataColumn(label: Text(
                                'Office Location',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                            DataColumn(label: Text(
                                'Building',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                            DataColumn(label: Text(
                                'Floor',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                            DataColumn(label: Text(
                                'Seat',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                            DataColumn(label: Text(
                                'Office Date',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                            DataColumn(label: Text(
                                'Status',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                            DataColumn(label: Text(
                                'Action',
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)
                            )),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('Malvern Campus')),
                              DataCell(Text('Malvern HQ')),
                              DataCell(Text('1')),
                              DataCell(Text('12')),
                              DataCell(Text('1-Jan-21')),
                              DataCell(Text('Pending')),
                              DataCell(
                                  Text('Facility Manager Approved Request')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Mississauga Campus')),
                              DataCell(Text('Malvern Innovation Center (MIC)')),
                              DataCell(Text('1')),
                              DataCell(Text('11')),
                              DataCell(Text('1-Jan-21')),
                              DataCell(Text('Completed')),
                              DataCell(Text('End User Cancelled Request')),
                            ]),

                          ],
                        )),

                  ],
                ))
          ]),
          Container(
              color: Colors.white,
              child: Container(
                  margin: EdgeInsets.only(left: 80.0, right: 10.0),
                  child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 18),
                            )
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: 20.0, top: 10.0, bottom: 10.0),
                            color: Colors.white,
                            child: Text(
                              'Next',
                              style: GoogleFonts.ubuntu(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 18),
                            )
                        ),

                      ]))
          ),
          Container(

            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: HexColor("#f2dede"),
              ),

              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Any requests marked with a red asterisk ( * ) means your requested seat assignment has been changed by a Facility Manager to accommodate social distancing guidelines.  The seat listed here is your assigned seat for this request.',
                    style: GoogleFonts.ubuntu(
                        color: HexColor("#a94442"), fontSize: 18),

                  )),

            ),
            margin: EdgeInsets.only(top: 10.0, bottom: 35.0),
          ),
          Container(
            color: HexColor("#5b5b5b"),
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Home Page', style: GoogleFonts.ubuntu(
                      color: HexColor("#ffffff"), fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Return To Work Process',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('New Request', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('My Requests', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Free Lunch Offer', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Contact Us', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Mobile Support', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('My Account', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Saint-Gobain', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Certainteed', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Legal Information', style: GoogleFonts.ubuntu(
                      color: Colors.white, fontSize: 16)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text('Copyright ©2020. All Rights Reserved',
                      style: GoogleFonts.ubuntu(
                          color: Colors.white, fontSize: 16)),
                ),

                Container(
                  margin: const EdgeInsets.only(
                      top: 15.0, right: 170.0, bottom: 20.0),
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
    );
  }
}


