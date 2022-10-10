import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'firebase_services.dart';
import 'homePage.dart';
import 'main.dart';

class delete extends StatefulWidget {
  @override
  State<delete> createState() => _deleteState();
}

class _deleteState extends State<delete> {

  final databaseReference = FirebaseDatabase.instance.ref();
  String _userEmailText =  FirebaseAuth.instance.currentUser.email.replaceAll(RegExp('[.]'), '');

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
              deleteData();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("User data deleted"),
              ));
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  login()));
            },
              child: Text("Delete Data"),
              color: Colors.blueAccent,
            ),
            FlatButton(onPressed: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
            },
              child: Text("Back"),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
  void deleteData() async{
    databaseReference.child(_userEmailText).remove();
  }
}





