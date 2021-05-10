import 'package:flutter/material.dart';
import 'package:ganbanking/Account.dart';

import 'Success.dart';
import 'Account.dart';
import 'Menu.dart';
import 'Petch_pin.dart';
import 'Total.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Total(),
    );
  }
}


   