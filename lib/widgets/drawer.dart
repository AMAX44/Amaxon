import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://idsb.tmgrup.com.tr/ly/uploads/images/2020/09/12/57778.jpg';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('Ammar Baig', textScaleFactor: 1.2),
                accountEmail: Text('talktoammarbaig@gmail.com', textScaleFactor: 1.1,),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white, 
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white), 
              ), 
            ),
             ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white, 
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white), 
              ),              
            ),
             ListTile(
              leading: Icon(
                CupertinoIcons.mail_solid,
                color: Colors.white, 
              ),
              title: Text(
                'Email',
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.white), 
              ),
              
            )
          ],
        ),
      ),
    );
  }
}