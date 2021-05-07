import 'package:flutter/material.dart';

class QRScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xff1C75FF),
              ),
              child: Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.navigate_before,
                      size: 32,
                    ),
                  ),
                  Container(
                    child: Text(
                      'สแกน',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Thasadith',
                          fontSize: 20),
                    ),
                    margin: EdgeInsets.only(left: 143.5),
                  ),
                ],
              ),
            ),
          Container(
            height: 298,
            width: 298,
            color: Color(0xffDEDEDE),
          ),
          Container(),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),

      ),
    );
  }
}
