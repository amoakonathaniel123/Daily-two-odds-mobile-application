import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';

class Splash extends StatefulWidget {
  SplashState createState() {
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Logins()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.height * 1,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(
          image: AssetImage(
            "assets/splash.png",
          ),
          height: 300,
        ),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          color: Color.fromARGB(255, 161, 159, 159),
        )
      ]),
    ));
  }
}
