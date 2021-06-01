import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:helpuser1/json/jsonP.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';

class News extends StatefulWidget {final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));
    getHttp();
    super.initState();
  }
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  var res;int items;
  void getHttp() async {
    try {
      var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=caf6d397f3d74ba19e32cfa6c55e6d52');

      setState(() {
        //articles[0].source
        res = jsonEncode(response.data);
        final newstojson = newstojsonFromJson(res);
        print(newstojson.articles[0].title);
items=newstojson.articles.length;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
        title: Text('Weather & News'),
      ),
      body: res == null
          ? Center(child: CircularProgressIndicator())
          :
          //articles
      ListView.builder(
              itemCount:items,
              itemBuilder: (BuildContext context, int index) {
                final newstojson = newstojsonFromJson(res);
                return Column(
                  children: [
                    ListTile(
                      onTap: () async{
                        await widget.browser.open(
                            url: Uri.parse(newstojson.articles[index].url==null?'https://www.bd-pratidin.com/':newstojson.articles[index].url),
                            options: ChromeSafariBrowserClassOptions(
                                android: AndroidChromeCustomTabsOptions(
                                    addDefaultShareMenuItem: false),
                                ios: IOSSafariOptions(barCollapsingEnabled: true)));

                      //  _launchInBrowser(newstojson.articles[index].url==null?'https://www.bd-pratidin.com/':newstojson.articles[index].url);
                      },
                      title: Row(
                        children: [
                          Image.network(
                            newstojson.articles[index].urlToImage==null?'https://image.freepik.com/free-vector/blue-breaking-news-tv-background_1017-14201.jpg':newstojson.articles[index].urlToImage,
                            height: 80,
                            width: (MediaQuery.of(context).size.width / 4),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width:
                                  (MediaQuery.of(context).size.width / 3) * 1.7,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                        newstojson.articles[index].title==null?'News Title is not Available':newstojson.articles[index].title,
                                        minFontSize: 10,
                                        maxLines: 3,
                                        overflow: TextOverflow.visible,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Gilroy',
                                        )),
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

showAlertDialog(BuildContext context, String news) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("My title"),
    content: Text(news),
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
