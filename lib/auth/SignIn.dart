import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpuser1/icon/icons.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  List<dynamic> userData = [];

  getUserData() {
    var dataFF2;

    firestoreInstance.collection("users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        dataFF2 = result.data();
        setState(() {
          userData.add(dataFF2);
        });
      });
      print(userData.length);
      print(userData[0]['email']);
      // allCourse = allCourseFromJson(gg[0]['json']);
    });
  }

  @override
  void initState() {
    getUserData();
    // TODO: implement initState
    super.initState();
  }

  final _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:StakedIcons()
              ),

              Text(
                'Help Droid',
                style: TextStyle(
                    fontSize: 35, fontFamily: 'Gilroy', color: Colors.blue),
              ),
              Text(
                'User Sign In',
                style: TextStyle(
                    fontSize: 30,

                    fontFamily: 'Gilroy',
                    color: Colors.blue),
              ),
              Form(
                key: _loginForm,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _userName,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email can not be empty';
                          }

                          return null;
                        },
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey[200], width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red[300], width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red[300], width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        controller: _password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password can not be empty';
                          }

                          return null;
                        },
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey[200], width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red[300], width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red[300], width: 0.0),
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          if (_loginForm.currentState.validate()) {
                            for (int i = 0; i < userData.length; i++) {
                              if (userData[i]['email'] == _userName.text &&
                                  userData[i]['password'] == _password.text) {
                                pref.setBool('islogIn', true);
                                pref.setString('email', _userName.text);
                                pref.setString('name', userData[i]['name']);
                                pref.setString('phn', userData[i]['phn']);
                                pref.setString('phn2', userData[i]['fa1']);
                                pref.setString('phn3', userData[i]['fa2']);
                                pref.setString('address', userData[i]['address']);
                                pref.setBool('sex', userData[i]['sex']);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Home(_userName.text)));
                              } else {}
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue,
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 20,

                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Try Again"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Something Wrong"),
      content: Text("Your Username/Password combination may wrong"),
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
}
