import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class AccidentReport extends StatefulWidget {
  @override
  _AccidentReportState createState() => _AccidentReportState();
}

class _AccidentReportState extends State<AccidentReport> {
  final firestoreInstance = FirebaseFirestore.instance;

  var dataFF2;
  List<dynamic> g = [];
  List<dynamic> gX = [];

  void _onPressed2() {
    firestoreInstance.collection("accident").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        dataFF2 = result.data();
        setState(() {
          g.add(dataFF2);
        });
      });
    });
  }

  @override
  void initState() {
    _onPressed2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Accident List',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Gilroy',
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateTimePicker(
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              dateLabelText: 'Date',
              onChanged: (val) {
                setState(() {
                  gX = [];
                });
                print('$val p');
                for (int i = 0; i < g.length; i++) {
                  if (g[i]['date'] == val) {
                    setState(() {
                      gX.add(g[i]);
                    });
                  }
                }
              },
              validator: (val) {
                print(val);
                print('x');
                return null;
              },
              onSaved: (val) => print('u'),
            ),
          ),
          gX == null
              ? CircularProgressIndicator()
              : SizedBox(
            height: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: gX.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          //gg
                        },
                        title: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(gX[index]['userEmail'],
                                  minFontSize: 10,
                                  maxLines: 3,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Gilroy',
                                  )),
                            ),
                            Container(
                              width: (MediaQuery.of(context).size.width /
                                  3) *
                                  1.7,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AutoSizeText(
                                          'Locality : ${gX[index]['location']}',
                                          minFontSize: 10,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'Gilroy',
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AutoSizeText(
                                          'City : ${gX[index]['city']}',
                                          minFontSize: 10,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Gilroy',
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AutoSizeText(
                                          'Date : ${gX[index]['date']}',
                                          minFontSize: 10,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Gilroy',
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AutoSizeText(
                                          'Details : ${gX[index]['Details']}',
                                          minFontSize: 10,
                                          maxLines: 3,
                                          overflow: TextOverflow.visible,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Gilroy',
                                          )),
                                    ),
                                  ],
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
          ),
        ],
      ),
    );
  }
}
