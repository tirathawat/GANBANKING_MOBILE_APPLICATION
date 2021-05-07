import 'package:flutter/material.dart';
import 'package:ganbanking/widget/List.dart';
import 'package:ganbanking/widget/ListPeo.dart';
import 'package:ganbanking/widget/bluePlus.dart';
import 'package:ganbanking/widget/find.dart';

class TransferingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(child: BluePlus()),
            ),
            Container(
              child: Text(
                "รายการโปรด",
                style: TextStyle(
                    color: Color(0xff1C1939),
                    fontSize: 18,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.normal),
                    
              ),
              margin: EdgeInsets.all(20),
            ),
            Container(
              child: Center(child: ListPeo()),
            ),
            Container(
                child: Center(
              child: Find(),
            )),
            Expanded(
              child: ListPro(),
              
            ),
          ],
        ),
      ),
    );
  }
}
