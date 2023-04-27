import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  var aa;

  Texts(this.aa);
  Widget build(BuildContext context) {
    return Text(
      aa,
      style: TextStyle(
          color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
    );
  }
}
