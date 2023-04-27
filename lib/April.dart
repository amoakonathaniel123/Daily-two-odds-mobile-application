import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Teams.dart';
import 'March.dart';
import 'Texts.dart';
import 'April.dart';
import 'main.dart';

class April extends StatelessWidget {
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomSheet: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            height: MediaQuery.of(context).size.height * 0.061,
            child: Column(children: [
              SizedBox(
                height: 8,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: double.infinity,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return March();
                                }));
                              },
                              child: Text(
                                "March 2023",
                                style: TextStyle(fontSize: 10),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return April();
                              }));
                            },
                            child: Text(
                              "April 2023",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ]),
          ),
          backgroundColor: Color.fromARGB(255, 199, 189, 189),
          appBar: AppBar(
            //sign out Icon

            leading: IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Login();
                }));
              },
              icon: Icon(Icons.logout),
            ),
            actions: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 30, 0),
                child: Image(
                  image: AssetImage(
                    "assets/boom.png",
                  ),
                  width: 70,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Image(
                  image: AssetImage(
                    "assets/telegram.png",
                  ),
                  width: 40,
                ),
              )
            ],
            title: Text("DAILY 2 ODDS",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 28, 76, 139),
          ),
          body: Column(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                      child: Texts(
                          "1 = Home Win | 2 = Away win | x = Draw | GG = Both teams to score"))),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                      child: Text(
                    "Kindly update app if new month's cant be found",
                    style: TextStyle(fontSize: 12),
                  ))),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                      child: Text(
                    "April 2023",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ))),
              SizedBox(
                height: 20,
              ),
              Container(
                  color: Color.fromARGB(255, 199, 189, 189),
                  width: double.infinity,
                  height: 596,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection("April")
                          .orderBy('order', descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }
                        final documents = snapshot.data!.docs;
                        return ListView.builder(
                            itemCount: documents.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                width: double.infinity,
                                height: 150,
                                color: Color.fromARGB(255, 233, 135, 56),
                                child: Column(children: [
                                  Container(
                                    color: Color.fromARGB(255, 28, 76, 139),
                                    width: double.infinity,
                                    height: 23,
                                    child: Center(
                                        child: Text(
                                      documents[index]['Date'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    color: Color.fromARGB(255, 8, 126, 18),
                                    width: double.infinity,
                                    height: 23,
                                    child: Center(
                                        child: Text(
                                      documents[index]['Team 1'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    color: Color.fromARGB(255, 8, 126, 18),
                                    width: double.infinity,
                                    height: 23,
                                    child: Center(
                                        child: Text(
                                      documents[index]['Team 2'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    color: Color.fromARGB(255, 8, 126, 18),
                                    width: double.infinity,
                                    height: 23,
                                    child: Center(
                                        child: Text(
                                      documents[index]['Team 3'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ]),
                              );
                            });
                      })),
            ],
          )),
    );
  }
}
