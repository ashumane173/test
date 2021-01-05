import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/MyAccount.dart';
import 'package:flutter_app/Pages/ContactUs.dart';
import 'package:flutter_app/Pages/NewRequest.dart';
import 'package:flutter_app/Pages/MyRequest.dart';
import 'package:flutter_app/Pages/ReturnToWork.dart';
import 'package:flutter_app/model/tblAccount.dart';
class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
            padding: EdgeInsets.zero,

            decoration: BoxDecoration(
                color: Colors.black,


                image: DecorationImage(
                    fit: BoxFit.fitWidth,

                    image: AssetImage('assests/sg-logo-white.png'),

                  scale: 0.5

                )),
            child: Text(
            'Welcome Ashwini Mane',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('My Account'),
            onTap: () => { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAccount(null)),
            )  },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Return To Work Process'),
            onTap: () => { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReturnToWork()),
            ) },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('New Request'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewRequest()),
            ) },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('My Requests'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyRequest()),
            )},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Contact Us'),
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactUs()),
            )  },
          ),
        ],
      ),
    );
  }
}