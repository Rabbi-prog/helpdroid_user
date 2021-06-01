import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:helpuser1/json/covid.dart';

import '../main.dart';

class Covid extends StatefulWidget {final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

@override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  var res;
  var item;
  void getHttp() async {
    try {
      var response = await Dio().get(
          'http://covid19tracker.gov.bd/api/country/latest?onlyCountries=true&iso3=BGD&fbclid=IwAR2hmNRpUxZ6785QTrCp_6CwbdQVUyptX5Wnw_SHCHPI7ZViaItngoQiqUs');

      setState(() {
        //articles[0].source
        res = jsonEncode(response.data);
        final newstojson = covidFromJson(res);
        item = newstojson;
        print(newstojson[0].name);
        //items=newstojson.articles.length;0.NewRecovered
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    getHttp();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return item == null
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.apps,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                'Covid Stats Bangladesh',
                style: TextStyle(fontFamily: 'Gilroy'),
              ),
              backgroundColor: Colors.deepPurple,
            ),
            body: ListView(
              children: [
                Conts('New Cases', item[0].newCases.toString()),
                Conts('New Deaths', item[0].newDeaths.toString()),
                Conts('New Recovered', item[0].newRecovered.toString()),
                Conts('Total Deaths', item[0].totalDeaths.toString()),
                Conts('Total Recovered', item[0].totalRecovered.toString()),
                Conts('Total Cases', item[0].totalCases.toString()),
GestureDetector(onTap:()async{


  await widget.browser.open(
      url: Uri.parse('http://covid19tracker.gov.bd/api/country/latest?onlyCountries=true&iso3=BGD&fbclid=IwAR2hmNRpUxZ6785QTrCp_6CwbdQVUyptX5Wnw_SHCHPI7ZViaItngoQiqUs'),
      options: ChromeSafariBrowserClassOptions(
          android: AndroidChromeCustomTabsOptions(
              addDefaultShareMenuItem: false),
          ios: IOSSafariOptions(barCollapsingEnabled: true)));

},child:Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ], //0.NewRecovered
      ),
      child: Center(child: Text('Source API (Application Program Interface)',style: TextStyle(fontFamily: 'Gilroy',color: Colors.deepPurple,),))),
) ,)
              ],
            ),
          ));
  }
}

class Conts extends StatelessWidget {
  final String x;
  final String y;
  Conts(this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], //0.NewRecovered
          ),
          child: Center(child: Text('$x  :  $y',style: TextStyle(fontFamily: 'Gilroy',),))),
    );
  }
}
