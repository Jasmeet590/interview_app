import 'package:flutter/material.dart';
import 'firebase_services.dart';
import 'homePage.dart';
import 'main.dart';

class logout extends StatefulWidget {


  @override
  State<logout> createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: () async{
              FirebaseServices().googleSignOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  login()));
            },
              child: Text("Logout"),
              color: Colors.blueAccent,
            ),
            FlatButton(onPressed: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
            },
              child: Text("Back"),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
