import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:helpuser1/contactUs.dart';
import 'package:helpuser1/menuitems/covid.dart';
import 'package:helpuser1/profile/profileView.dart';
import 'package:share/share.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'menuitems/Donate.dart';
import 'menuitems/ar.dart';
import 'menuitems/hospitals.dart';
import 'menuitems/news.dart';

class MenuSegment extends StatefulWidget {
  @override
  _MenuSegmentState createState() => _MenuSegmentState();
}

class _MenuSegmentState extends State<MenuSegment> {
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
        title: Text('Menu'),
actions: [
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(onTap: (){
      Share.share('check out my app https://example.com');
    },child: Icon(Icons.share,color: Colors.white,)),
  )
],
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Covid()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryXx('Covid Stats','https://i.pinimg.com/564x/e7/3f/d7/e73fd73306a00f7286f85b5d67d0ea1d.jpg'),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:CategoryXx('Home','https://i.pinimg.com/564x/07/b0/af/07b0afafed674cf29d7311f2968d79bf.jpg'),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileView()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryXx('Profile','https://i.pinimg.com/564x/0b/8d/c4/0b8dc45408e860c433d06479918b1342.jpg'),
                )),
            Station('Hospitals', Icons.medical_services,'https://i.pinimg.com/564x/fa/f5/f8/faf5f85ca88322da5c3c36283d730b31.jpg'),
            Station('Police_Station', Icons.local_police,'https://i.pinimg.com/564x/f8/c1/73/f8c1731f0efcb1ed84f4c7a355b8f754.jpg'),
            Station('Fire_Station', Icons.fire_extinguisher_sharp,'https://i.pinimg.com/236x/c4/e2/b1/c4e2b14af67229ae560e993c90a0cd53.jpg'),
            Station('Blood', Icons.bluetooth,'https://i.pinimg.com/236x/a9/6a/47/a96a4709b064211e037e53f3a1e62fe0.jpg'),
            Station('Banks', Icons.attach_money,'https://i.pinimg.com/564x/d4/40/bb/d440bb435fe4e1380c29c7d80dea0b91.jpg'),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => News()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryXx('Weather & News','https://i.pinimg.com/564x/85/3e/bc/853ebc2eca935c2b31c636f539e070ed.jpg'),
                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AccidentReport()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryXx('Accident Reports','https://i.pinimg.com/564x/7f/ac/6c/7fac6c65a25f5771420a2c3b1773790e.jpg'),

                )),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Donate()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryXx('Donate Money','https://i.pinimg.com/564x/47/c7/36/47c7362e2f71971b773bed1a6c8bbdbc.jpg'),
                )),
          ]),
    );
  }
}

class Station extends StatelessWidget {
  final String station;
  final IconData icon;
  final String img;
  Station(this.station, this.icon,this.img);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Hospitals(station)));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CategoryXx(station,img),
        ));
  }
}
