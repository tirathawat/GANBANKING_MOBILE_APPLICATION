import 'package:flutter/material.dart';
import 'package:ganbanking/page/My_qr_code.dart';
import 'package:ganbanking/page/Transfering_Screen2.dart';
import 'package:ganbanking/page/qr_scan.dart';
import 'package:ganbanking/page/receipt_screen.dart';
import 'package:ganbanking/page/transfering_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'App Test',
    home: QRScan(),
    
    );
  }
}
