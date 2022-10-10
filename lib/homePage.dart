import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'delete.dart';
import 'logout.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.teal,
        body: Brain(),
      ),
    );
  }
}

class Brain extends StatefulWidget {
  const Brain({Key key}) : super(key: key);

  @override
  State<Brain> createState() => _BrainState();
}

class _BrainState extends State<Brain> {

  final databaseReference = FirebaseDatabase.instance.ref();

  TextEditingController _userName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _comment = TextEditingController();



  String _userEmailText =  FirebaseAuth.instance.currentUser.email.replaceAll(RegExp('[.]'), '');
  String _userImage = FirebaseAuth.instance.currentUser.photoURL;


  @override
  Widget build(BuildContext context) {
     _userName.text = FirebaseAuth.instance.currentUser.displayName;
     _number.text = FirebaseAuth.instance.currentUser.phoneNumber;

    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image(
                    image: NetworkImage(_userImage),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  FirebaseAuth.instance.currentUser.email,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _userName,
                  decoration: InputDecoration(
                      hintText: "User name",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _address,
                  decoration: InputDecoration(
                      hintText: "Address",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _age,
                  decoration: InputDecoration(
                      hintText: "Age",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _number,
                  decoration: InputDecoration(
                      hintText: "Number",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _comment,
                  decoration: InputDecoration(
                      hintText: "Comment",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(onPressed: (){
                  createData();
                },
                  child: Text("Submit"),
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  logout()));
                    },
                      child: Text("Logout Page"),
                      color: Colors.blueAccent,
                    ),
                    FlatButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  delete()));
                    },
                      child: Text("Delete Data Page"),
                      color: Colors.blueAccent,
                    ),
                  ],
                )
              ],
            )
        ),
    );
  }

  void createData(){
    databaseReference.child(_userEmailText).set({
      'User Name': _userName.text,
      'Address': _address.text,
      'Age': _age.text,
      'Number': _number.text,
      'Comment': _comment.text,
    });
  }
}

