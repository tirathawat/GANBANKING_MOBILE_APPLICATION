import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1C75FF),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "G-BANK",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 100,
                ),
              ),
              Text(
                "Online banking for your life",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 30,
                ),
              )
            ],
          ),
        )));
  }
}
