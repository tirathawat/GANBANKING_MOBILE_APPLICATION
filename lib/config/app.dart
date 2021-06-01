import 'package:flutter/material.dart';
import 'package:ganbanking/pages/auth/splash_page.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GANBANKING',
      home: SplashPage(),
    );
  }
}
