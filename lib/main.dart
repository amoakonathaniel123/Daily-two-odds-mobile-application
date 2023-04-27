import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:two_odds/March.dart';
import 'splash.dart';

class Login extends StatefulWidget {
  LoginState createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Logins extends StatefulWidget {
  LoginsState createState() {
    return LoginsState();
  }
}

class LoginsState extends State<Logins> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          height: 900,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image(
              image: AssetImage("assets/login.png"),
              height: 200,
            ),
            Image(
              image: AssetImage("assets/daily2odds.png"),
              height: 110,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 35,
              child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      labelText: "Enter Email",
                      labelStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            SizedBox(height: 30),
            Container(
              height: 35,
              child: TextField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: "Enter Password",
                    labelStyle: TextStyle(fontSize: 12)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: emailcontroller.text,
                        password: passwordcontroller.text);
                    if (user != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return March();
                      }));
                    }
                  } catch (e) {
                    return showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 50,
                            child: Center(
                              child: Text(e.toString()),
                            ),
                          );
                        });
                  }
                },
                child: Text("Enter"))
          ]),
        )
      ]),
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Login());
}
