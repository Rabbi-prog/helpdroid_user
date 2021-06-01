import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'main.dart';

class ContactUs extends StatefulWidget {final ChromeSafariBrowser browser = new MyChromeSafariBrowser();
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
        }));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Center(child: SingleChildScrollView(
        child: Column(children: [
          Text(
            'Md. Arif Hossain',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Gilroy',
                fontSize: 35),
          ),

          Container(height: 200,width: MediaQuery.of(context).size.width,
            child:
            ListView(scrollDirection: Axis.horizontal,children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                  await widget.browser.open(
                        url: Uri.parse('https://www.facebook.com/arif.sanjid'),
                        options: ChromeSafariBrowserClassOptions(
                            android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false),
                            ios: IOSSafariOptions(barCollapsingEnabled: true)));
                  },
                  child: CategoryXx('Facebook', 'https://i.pinimg.com/564x/59/8c/ae/598cae0d99a402d8c8501151305dcfdf.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await widget.browser.open(
                        url: Uri.parse('https://www.instagram.com/rabbi__vai/'),
                        options: ChromeSafariBrowserClassOptions(
                            android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false),
                            ios: IOSSafariOptions(barCollapsingEnabled: true)));
                  },
                  child: CategoryXx('Instagram', 'https://i.pinimg.com/236x/76/00/8b/76008bb9685d410d47fe1fa01dc54f15.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await widget.browser.open(
                        url: Uri.parse('https://www.linkedin.com/in/md-arif-hossain-75a970182/'),
                        options: ChromeSafariBrowserClassOptions(
                            android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false),
                            ios: IOSSafariOptions(barCollapsingEnabled: true)));
                  },
                  child: CategoryXx('LinkedIn', 'https://i.pinimg.com/564x/0b/10/4b/0b104bb37cd2dc6b00c327c69bd3ac53.jpg'),
                ),
              )

            ],),
          ),
          Text(
            'Rakib Mohammad Rayhan',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Gilroy',
                fontSize: 35),
          ),
          Container(height: 200,width: MediaQuery.of(context).size.width,
            child:
            ListView(scrollDirection: Axis.horizontal,children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await widget.browser.open(
                        url: Uri.parse('https://www.facebook.com/RakibMohammadRayhan'),
                        options: ChromeSafariBrowserClassOptions(
                            android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false),
                            ios: IOSSafariOptions(barCollapsingEnabled: true)));
                  },
                  child: CategoryXx('Facebook', 'https://i.pinimg.com/564x/59/8c/ae/598cae0d99a402d8c8501151305dcfdf.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await widget.browser.open(
                        url: Uri.parse('https://www.instagram.com/_badman__7/'),
                        options: ChromeSafariBrowserClassOptions(
                            android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false),
                            ios: IOSSafariOptions(barCollapsingEnabled: true)));
                  },
                  child: CategoryXx('Instagram', 'https://i.pinimg.com/236x/76/00/8b/76008bb9685d410d47fe1fa01dc54f15.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    await widget.browser.open(
                        url: Uri.parse('https://www.linkedin.com/in/rakibmohammadrayhan/'),
                        options: ChromeSafariBrowserClassOptions(
                            android: AndroidChromeCustomTabsOptions(
                                addDefaultShareMenuItem: false),
                            ios: IOSSafariOptions(barCollapsingEnabled: true)));
                  },
                  child: CategoryXx('LinkedIn', 'https://i.pinimg.com/564x/0b/10/4b/0b104bb37cd2dc6b00c327c69bd3ac53.jpg'),
                ),
              )

            ],),
          ),
        ],),
      ),),),
    );
  }
}

class CategoryXx extends StatefulWidget {
  final String name;
  // final String name2;
  final String iimage;
  CategoryXx(this.name, this.iimage);

  @override
  _CategoryXxState createState() => _CategoryXxState();
}

class _CategoryXxState extends State<CategoryXx> {
  @override
  void initState() {
    random();
    super.initState();
  }

  int p = 0;

  int random() {
    var rng = new Random();
    p = rng.nextInt(colorList.length);
    return p;
  }

  List<Color> colorList = [
    Color(0xfffeecbb),
    Color(0xffc3f0dc),
    Color(0xfff9B7c8),
    Color(0xffb5ccFe),
    Color(0xffafdbfb),
    Color(0xffd3b2fe),
    Colors.greenAccent,
    Color(0xff9CC2F4),
    Color(0xffC69CF4),
    Color(0xffD1FAF0),
    Color(0xffF4DC9C),
    Color(0xff66A1EE),
    Color(0xff66D7EE),
    Color(0xff9CF4DF),
    Color(0xffBCEE66),
    Color(0xffEE66AA),
    Color(0xffA866EE),
    Color(0xffF4B69C),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: colorList[p],
            border: Border.all(color: Colors.white.withOpacity(0.08)),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.blueAccent,
                backgroundImage: NetworkImage(widget.iimage),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 30,
              width: 120,
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
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: AutoSizeText(widget.name,
                      minFontSize: 10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        // backgroundColor: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                      )),
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(5.0),
            //   child: AutoSizeText(widget.name,
            //       minFontSize: 10,
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //       style: TextStyle(
            //         // backgroundColor: Colors.white,
            //         fontSize: 20,
            //         fontFamily: 'Gilroy',
            //       )),
            // ),
          ],
        ),
      ),
    );
  }
}
