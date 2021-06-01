import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firestoreInstance = FirebaseFirestore.instance;
  String uid;
  var b;
  String medicalcollege, photoURL, email;

  String deviceId;

  String string;

  var dataFF2;

  @override
  void initState() {
    super.initState();
  }

  final _loginForm = GlobalKey<FormState>();
  bool userPasswordVisible = false;
  bool sex = true;
  TextEditingController _userName = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _phone2 = TextEditingController();
  TextEditingController _phone3 = TextEditingController();
  String dVClass;
  Map<String, dynamic> loginData = Map<String, dynamic>();
  Map<String, dynamic> currentData = Map<String, dynamic>();

  List<String> typeNeg = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80, left: 30, right: 30),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          height: 650,
                          //   height: constraints.maxHeight * 0.3, constraints.maxWidth * 0.85
                          width: 300,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent.withOpacity(0.2),
                                    Colors.lightBlueAccent.withOpacity(0.05)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.08)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Form(
                                  key: _loginForm,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Text(
                                          'Hi there, Lets know a bit about you!',
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              color: Colors.blue,
                                              fontSize: 30),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          controller: _userName,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Name can not be empty';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red[300],
                                                        width: 0.0),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                            filled: true,
                                            border: InputBorder.none,
                                            hintText: 'Name',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          controller: _phone,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Phone can not be empty';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red[300],
                                                        width: 0.0),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                            filled: true,
                                            border: InputBorder.none,
                                            hintText: 'Phone Number',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          controller: _phone2,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Family Phone Number can not be empty';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius: BorderRadius
                                                    .circular(10)),
                                            filled: true,
                                            border: InputBorder.none,
                                            hintText: 'Family Phone Number',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          keyboardType: TextInputType.phone,
                                          controller: _phone3,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Family Phone Number can not be empty';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                            OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius: BorderRadius
                                                    .circular(10)),
                                            filled: true,
                                            border: InputBorder.none,
                                            hintText: 'Family Phone Number',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: DropdownButtonFormField<String>(
                                          value: dVClass,
                                          hint: Text("Select Gender"),
                                          onChanged: (String newValue) {
                                            if (newValue == 'Male') {
                                              setState(() {
                                                dVClass = newValue;
                                                sex = true;
                                              });
                                            } else {
                                              setState(() {
                                                dVClass = newValue;
                                                sex = false;
                                              });
                                            }
                                          },
                                          validator: (String value) {
                                            if (value?.isEmpty ?? true) {
                                              return 'Please select your Gender';
                                            }
                                          },
                                          items: typeNeg
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onSaved: (val) =>
                                              setState(() => dVClass = val),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          controller: _email,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Email can not be empty';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red[300],
                                                        width: 0.0),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
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
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red[300],
                                                        width: 0.0),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextFormField(
                                          controller: _address,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Address can not be empty';
                                            }

                                            return null;
                                          },
                                          decoration: new InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey[200],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red[300],
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red[300],
                                                        width: 0.0),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                            filled: true,
                                            border: InputBorder.none,
                                            hintText: 'Address',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (_loginForm.currentState
                                                .validate()) {
                                              EasyLoading.show(
                                                  status: 'loading...');
                                              // SharedPreferences pref =
                                              //     await SharedPreferences
                                              //         .getInstance();

                                              firestoreInstance
                                                  .collection("users")
                                                  .doc(_email.text)
                                                  .set({
                                                'name':
                                                    _userName.text, // John Doe
                                                'phn': _phone
                                                    .text, // Stokes and Sons
                                                'password':
                                                    _password.text,
                                                'fa1':_phone2.text,// 42
                                                'fa2':_phone3.text,// 42
                                                'sex': sex,
                                                'address': _address.text,
                                                'email': _email.text,
                                              },SetOptions(merge: true)).then((_) async {
                                                print("success!");
                                              });
                                              EasyLoading.dismiss();
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          SignIn()));
                                            } else {
                                              //  print("invalid");
                                            }
                                          },
                                          child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 3,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontFamily: 'Gilroy',
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}
