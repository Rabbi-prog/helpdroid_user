import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hospitals extends StatefulWidget {
  final String ss;
  Hospitals(this.ss);
  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  final firestoreInstance = FirebaseFirestore.instance;

  _launchURL(String urll) async {
    if (await canLaunch(urll)) {
      await launch(urll);
    } else {
      throw 'Could not launch $urll';
    }
  }

  var dataFF2;
  List<dynamic> g = [];
  void _onPressed2() {
    firestoreInstance.collection(widget.ss).get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        dataFF2 = result.data();
        setState(() {
          g.add(dataFF2);
        });
      });
    });
  }

  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _onPressed2();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _launched;
  @override
  Widget build(BuildContext context) {
    return g == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(backgroundColor:Colors.deepPurple,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(widget.ss,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Gilroy',
                  )),
              actions: [ GestureDetector(
                onTap: () {
                 showAlertDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),],
              // backgroundColor: kblue,
            ),
            body: ListView.builder(
                itemCount: g.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Image.network(
                              g[index]['photoURL'],
                              height: 80,
                              width: (MediaQuery.of(context).size.width / 4),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: (MediaQuery.of(context).size.width / 3) *
                                    1.7,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(g[index]['name'],
                                          minFontSize: 10,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Gilroy',
                                          )),
                                      AutoSizeText(g[index]['address'],
                                          minFontSize: 10,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Gilroy',
                                          )),
                                      // AutoSizeText(g[index]['phn'],
                                      //     minFontSize: 10,
                                      //     maxLines: 3,
                                      //     overflow: TextOverflow.visible,
                                      //     style: TextStyle(
                                      //       fontSize: 20,
                                      //       fontFamily: 'Gilroy',
                                      //     )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _launched = makePhoneCall(
                                                    'tel:${g[index]['phn']}');
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.call,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _launchURL(g[index]['map']);
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child: Icon(
                                                Icons.map,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 2,
                      )
                    ],
                  );
                }),
          );
  }
}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {Navigator.of(context, rootNavigator: true).pop(); },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Search "),
    content: TextField(),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}