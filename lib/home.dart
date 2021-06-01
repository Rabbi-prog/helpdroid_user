import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:access_settings_menu/access_settings_menu.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helpuser1/contactUs.dart';
import 'package:helpuser1/profile/profileView.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:marquee/marquee.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms/sms.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menuSegment.dart';
import 'menuitems/hospitals.dart';

class Home extends StatefulWidget {
  final String email;
  Home(this.email);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String _address = "";
  void _getCurrentLocation() async {
    openSettingsMenu('ACTION_LOCATION_SOURCE_SETTINGS');
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    print('ggg   g  $position');
    // create this variable

    List<Placemark> newPlace = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);

    // this is all you need
    Placemark placeMark = newPlace[0];
    String name = placeMark.name;
    String subLocality = placeMark.subLocality;
    String locality = placeMark.locality;
    String administrativeArea = placeMark.administrativeArea;
    String postalCode = placeMark.postalCode;
    String country = placeMark.country;
    String address =
        "${name}, ${subLocality}, ${locality}, ${administrativeArea} ${postalCode}, ${country}";

    print(address);

    setState(() {
      _address = address; // update _address
    });
  }

  openSettingsMenu(settingsName) async {
    var resultSettingsOpening = false;

    try {
      resultSettingsOpening =
          await AccessSettingsMenu.openSettings(settingsType: settingsName);
    } catch (e) {
      resultSettingsOpening = false;
    }
  }

  AnimationController _controller;
  String x = 'PANIC';
  List<String> typeNeg = [
    "Hospital",
    "Police Station",
    "Fire Station",
    "Blood",
  ];
  //final assetsAudioPlayer = AssetsAudioPlayer();

  play() {
    // assetsAudioPlayer.open(
    //   Audio("asset/A.mp3"),
    // );
  }

  String dVClass;
  @override
  void initState() {
    link();
  getDataX();
    _getCurrentLocation();
    super.initState();

    _controller = new AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 1),
    );
  }

  var b;
  String c;
  void link() async {
    b = await FirebaseFirestore.instance
        .collection("AdminText")
        .doc('adminText')
        .get();
    setState(() {
      c = b.data()['Details'];
    });
  }

  final firestoreInstance = FirebaseFirestore.instance;

  String name, image, clg, phn, email, address;
  Color kblue = Colors.blue;
  bool sex;
  String date;
  Future<void> makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launched;
  String phn2, phn3;
  // getData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //
  //
  //
  //   var res = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('email', isEqualTo: widget.email)
  //       .get();
  //
  //   res.docs.forEach((res) {
  //     pref.setString('name', res.data()['name']);
  //     pref.setString('address', res.data()['address']);
  //     pref.setString('phone', res.data()['phone']);
  //     pref.setString('college', res.data()['college']);
  //     pref.setString('class', res.data()['class']);
  //     pref.setString('session', res.data()['session']);
  //
  //
  //   });
  // }

  getDataX() async {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    date = formatter.format(now);

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name');
      address = pref.getString('address');
      phn = pref.getString('phn');
      email = pref.getString('email');
      phn2 = pref.getString('phn2');
      phn3 = pref.getString('phn3');

      sex = pref.getBool('sex');
    });
  }

  final _loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
             // decoration: BoxDecoration(
             //    borderRadius: BorderRadius.circular(15),
             //    color: Colors.deepPurple,
             //    // boxShadow: [
             //    //   BoxShadow(
             //    //     color: Colors.grey.withOpacity(0.5),
             //    //     spreadRadius: 2,
             //    //     blurRadius: 3,
             //    //     offset: Offset(0, 1), // changes position of shadow
             //    //   ),
             //    // ],
             //  ),
              child: Image.network(
                'https://i.pinimg.com/originals/c3/ed/b6/c3edb68b25f1721cc3a648ec70805526.jpg',
              ),
            ),
            ListTile(
              title: Text(
                'Created By Md. Arif Hossain & Rakib Mohammad Rayhan',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontFamily: 'Gilroy',
                    fontSize: 15),
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileView()));
              },
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.supervised_user_circle_outlined,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'About',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: (){

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ContactUs()));

              },
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.phone,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Contact Dev ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Gilroy',
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: GestureDetector(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();

                  pref.setBool('islogIn', false);
                  Phoenix.rebirth(context);
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Gilroy',
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => MenuSegment()));
            },
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.apps,
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontFamily: 'Gilroy'),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StationH('Hospitals', Icons.medical_services),
            StationH('Police_Station', Icons.local_police),
            StationH('Fire_Station', Icons.fire_extinguisher_sharp),
            StationH('Blood', Icons.bluetooth),
          ],
        ),
      ),
      body: Form(
        key: _loginForm,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: AutoSizeText(
                    c == null ? '' : c,
                    style: TextStyle(fontFamily: 'Gilroy', fontSize: 35,color: Colors.white,backgroundColor: Colors.red),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButtonFormField<String>(
                value: dVClass,
                hint: Text(
                  "Select Case",
                  style: TextStyle(fontFamily: 'Gilroy'),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dVClass = newValue;
                  });
                },
                validator: (String value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please select your Case';
                  }
                },
                items: typeNeg.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onSaved: (val) => setState(() => dVClass = val),
              ),
            ),
            GestureDetector(
              onTap: () async {
                if (_loginForm.currentState.validate()) {
                  print('x');
                  if (x == 'PANIC') {
                    FlutterRingtonePlayer.playAlarm();
                    setState(() {
                      x = 'STOP';
                      // ////////////////////////////////////send case to server
                      // play();
                      firestoreInstance.collection("accident").doc().set({
                        'Details': dVClass, // John Doe
                        'city': address, // Stokes and Sons
                        'location': _address,
                        'userEmail': widget.email,
                        'familyNO1': phn2,
                        'familyNO2': phn3,
                        'date': date,
                      }).then((_) async {
                        print("success!");
                        SmsSender sender = new SmsSender();
                        String address = phn2;String address2 = phn3;
                        sender.sendSms(new SmsMessage(address2, 'I am in need of $dVClass'));
                        sender.sendSms(new SmsMessage(address, 'I am in need of $dVClass'));
                        setState(() {
                          _launched = makePhoneCall('tel:999');
                        });
                      });
                    });
                  } else {
                    FlutterRingtonePlayer.stop();

                    setState(() {
                      x = 'PANIC';
                    });
                  }
                }
              },
              child: CustomPaint(
                painter: SpritePainter(_controller),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Center(
                      child: Text(
                    x,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 35),
                  )),
                ),
              ),
            ),
SizedBox(height: 60,)
          ],
        ),
      ),
    );
  }
}

class SpritePainter extends CustomPainter {
  final Animation<double> _animation;

  SpritePainter(this._animation) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = new Color.fromRGBO(255, 0, 0, opacity);

    double size = rect.width / 1.3;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = new Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}

class StationH extends StatelessWidget {
  final String station;
  final IconData icon;
  StationH(this.station, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Hospitals(station)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(station,style: TextStyle(fontFamily: 'Gilroy',fontSize: 12),),
                    ),
                  ],
                ),
              )),
        ));
  }
}
