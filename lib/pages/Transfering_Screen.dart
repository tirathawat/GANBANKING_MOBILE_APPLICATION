import 'package:flutter/material.dart';
import 'package:ganbanking/widgets/find.dart';
import 'package:ganbanking/widgets/listpeople.dart';
import 'package:ganbanking/widgets/listpeople2.dart';
import 'package:ganbanking/widgets/transfer2.dart';

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
              child: Center(child: TransFer2()),
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
              child: Center(child: ListPeople()),
            ),
            Container(
                child: Center(
              child: Find(),
            )),
            Expanded(
              child: ListPeople2(),
            ),
          ],
        ),
      ),
    );
  }
}
