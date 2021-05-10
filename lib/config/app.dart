import 'package:flutter/material.dart';
import 'package:ganbanking/pages/mobile_number_page.dart';
import 'package:ganbanking/pages/my_qrcode_page.dart';
import 'package:ganbanking/pages/qr_scan_page.dart';
import 'package:ganbanking/pages/splash_page.dart';
import 'package:ganbanking/pages/verifying_number_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily: 'Thasadith'),
      title: 'GANBANKING',
      home: VerifyingNumberPage(),
    );
  }
}
