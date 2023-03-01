import 'package:flutter/material.dart';
import 'package:mahglobal/config/colors.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    Navigator.of(context)
        .pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primary,
        body: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 250),
                Flexible(
                  child: Text(
                    "mahglobal",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  // Container(
                  // Text("Splash"),
                  // height: 100,
                  // width: 150,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  //   image: DecorationImage(
                  //     image: AssetImage('assets/icon.png'),
                  //   ),
                  // ),
                  // ),
                ),
              ],
            ),
          ),
        ),
      );
}
