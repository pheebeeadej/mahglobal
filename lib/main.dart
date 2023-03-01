import 'package:flutter/material.dart';
import './screens/splashscreen.dart';
import './screens/home.dart';
import './screens/dashboard.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mahglobal',
      routes: <String, WidgetBuilder>{
        //All available pages
        '/Splash': (BuildContext contrext) => new Splash(),
        '/Home': (BuildContext context) => new Home(),
        '/Dashboard': (BuildContext context) => new Dashboard(),
      },

      theme: new ThemeData(primarySwatch: Colors.deepPurple),

      // primarySwatch: new ThemeData(primarySwatch: Colors.deepPurple),
      home: Splash(),
      // AnimatedSplashScreen(
      //   splash: 'assets/images/app_logo.png',
      //   // Container(
      //   //   height: 1000,
      //   //   width: 1000,
      //   //   decoration: BoxDecoration(
      //   //     borderRadius: BorderRadius.circular(20),
      //   //     image: DecorationImage(
      //   //       image: AssetImage(),
      //   //     ),
      //   //   ),
      //   // ),

      //   nextScreen: Splash(),
      //   duration: 5000,
      //   backgroundColor: Colors.deepPurpleAccent,
      //   splashTransition: SplashTransition.fadeTransition,
      // ), //first page displayed
    );
  }
}
