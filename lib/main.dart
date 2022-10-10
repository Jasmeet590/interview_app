import 'package:flutter/material.dart';
import 'package:interview_app/firebase_services.dart';
import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MaterialApp(home:login()));
}

class login extends StatefulWidget {
  const login({Key key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
  
}
class _loginState extends State<login> {
  @override
  void loginTrue(){
    if(FirebaseAuth.instance.currentUser.emailVerified == true){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+91 9888775140',
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.teal.shade900,
                        fontSize: 20),
                  ),
                )
            ),
            FlatButton(onPressed: (){
            },
              child: Text("Login"),
              color: Colors.blueAccent,
            ),
            SizedBox(
              height: 30,
              width: 200,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Builder(
              builder: (context) {
                return FloatingActionButton(
                  child: Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/google.png'),
                    ),
                  ),
                  onPressed: () async{
                    await FirebaseServices().signInWithGoogle();
                    loginTrue();
                  },
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}





