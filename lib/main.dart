import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './profile_page.dart';

import 'bubble_anim/particle_background.dart';

import 'package:flutter/services.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(MyApp());
}

// main() {
//   debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        fontFamily: "GoogleSansRegular",
      ),
      home: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Stack(
          children: <Widget>[
            ParticleBackgroundPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
