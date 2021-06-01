import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'dart:io';
void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
class Donate extends StatefulWidget {final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('To Donate Money:',style: TextStyle(fontSize: 40,color: Colors.green),
                   ),
              ),
            ),
            GestureDetector(
              onTap: () async{
                openApp(context, 'Bkash','com.bKash.customerapp','https://play.google.com/store/apps/details?id=com.bKash.customerapp');

              },child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 78,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:  Colors.pink,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ], //0.NewRecovered
              ),
                child: Center(
                  child: Text(
                    'bKash : 01820836709',style: TextStyle(fontSize: 30,color: Colors.white),),
                ),
              ),
            ),
            ),
            GestureDetector(
                  onTap: () async{
                    openApp(context, 'Rocket','com.dbbl.mbs.apps.main','https://play.google.com/store/apps/details?id=com.dbbl.mbs.apps.main');
                   // _launchURL('https://play.google.com/store/apps/details?id=com.dbbl.mbs.apps.main');
                    // await widget.browser.open(
                    //     url: Uri.parse('https://play.google.com/store/apps/details?id=com.dbbl.mbs.apps.main'),
                    //     options: ChromeSafariBrowserClassOptions(
                    //         android: AndroidChromeCustomTabsOptions(
                    //             addDefaultShareMenuItem: false),
                    //         ios: IOSSafariOptions(barCollapsingEnabled: true)));

                  },child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height:78,decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepPurple,
              boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
              ], //0.NewRecovered
            ),
                      child: Center(
                        child: Text(
                        'Rocket : 01814297886',style: TextStyle(fontSize: 30,color: Colors.white),),
                      ),
                    ),
                  ),
                ),
            GestureDetector(
              onTap: () async{
                openApp(context, 'Nagad','com.konasl.nagad','https://play.google.com/store/apps/details?id=com.konasl.nagad');

              },child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 78,decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color:  Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ], //0.NewRecovered
              ),
                child: Center(
                  child: Text(
                    'Nagad : 01814297886',style: TextStyle(fontSize: 30,color: Colors.deepOrange),),
                ),
              ),
            ),
            ),
          ],
        ),


      ),
    );
  }
}
void openApp(BuildContext context,String x,String xy,String xyz) {
  try {
    AppAvailability.launchApp(Platform.isIOS
        ? "$x://"
        : xy
    ).then((_) {
      print("App Launched!");
    }).catchError((err) {
      AppAvailability.launchApp(Platform.isIOS
          ? "appstore://"
          : "com.android.vending"
      )
// I think I will need to add package name to the playstore package name
// in the line above, but not sure how.
// I have tried com.android.vending?id=com.criticalarc.safezoneapp
// and com.android.vending/com.criticalarc.safezoneapp

          .then((_) {});
      print(err); _launchURL(xyz);
    });
  } catch (e) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("App Not Installed!"),
      ),
    );
    print("App Not Installed!");
  }
}