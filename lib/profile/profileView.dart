

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:helpuser1/auth/SignUp.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'editp.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name, image, clg, phn, email, add,phn2,phn3;
  Color kblue = Colors.blue;
  bool sex;
  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name');
add=pref.getString('address');
      phn = pref.getString('phn');
      phn2 = pref.getString('phn2');phn3 = pref.getString('phn3');

      email = pref.getString('email');
      sex = pref.getBool('sex');
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,
        elevation: 0,title: Text('Profile',style: TextStyle(fontFamily: 'Gilroy'),),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => EditP(email)));
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(backgroundColor: Colors.deepPurple,radius: 105,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    backgroundImage: sex == true
                        ? NetworkImage(
                            'https://image.freepik.com/free-vector/young-man-living-room-character-scene_24877-57826.jpg',
                          )
                        : NetworkImage(
                      'https://image.freepik.com/free-vector/young-woman-standing-white_25030-39533.jpg',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height:100,width: MediaQuery.of(context).size.width ,
                  child: Center(
                    child: AutoSizeText(
                      name == null ? 'Hi friend' : 'Name: $name',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      color: kblue,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      phn == null ? '01xxxxxxxxx' : phn,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ),
                ],
              ),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.email,
                      color: kblue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      email == null ? 'x@gmai.com' : email,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ),
                ],
              ),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.home,
                      color: kblue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      email == null ? 'Address' : add,
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      color: kblue,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      phn2 == null ? '01xxxxxxxxx' : 'Family no $phn2',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      color: kblue,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      phn3 == null ? '01xxxxxxxxx' : 'Family no $phn3',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.bold,
                          color: kblue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
