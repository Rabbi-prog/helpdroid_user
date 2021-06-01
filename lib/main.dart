import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:helpuser1/icon/icons.dart';
import 'package:helpuser1/menuitems/news.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'auth/SignUp.dart';
import 'auth/homepage.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Phoenix(
    child: MaterialApp(
      home: MyApp(),
      builder: EasyLoading.init(),
    ),
  ));
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getSharedDAta() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool('islogIn');
    email = pref.getString('email');
    Future.delayed(Duration(seconds: 1), () {
      decideScreen();
    });
  }

  @override
  void initState() {
    getSharedDAta();

    super.initState();
  }

  bool isLogin;
  String email;
  decideScreen() {
    isLogin == true
        ? Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) =>
        Home(email)

    ))
        : Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StakedIcons(),
          Text(
            'Help Droid',
            style:
                TextStyle(fontSize: 35, fontFamily: 'Gilroy', color: Colors.blue),
          ),
        ],
      ),
    ));
  }
}
