import 'package:flutter/material.dart';
import 'package:ganbanking/pages/receipt_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GANBANKING',
      home: ReceiptPage(),
    );
  }
}
