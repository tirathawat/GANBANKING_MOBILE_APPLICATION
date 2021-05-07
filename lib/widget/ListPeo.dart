import 'package:flutter/material.dart';

class ListPeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              height: 164,
              width: 142,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Rectangle Copy 3.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Hailey',
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontFamily: 'DMSans',
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '+090078601',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontFamily: 'DMSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom: 20),

              margin: EdgeInsets.all(5),
            ),
            Container(
              height: 164,
              width: 142,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Rectangle Copy 8.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Zayn',
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontFamily: 'DMSans',
                      fontSize: 13,
                    ),
                  ),
                   Text(
                    '+090078601',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontFamily: 'DMSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.all(5),
            ),
            Container(
              height: 164,
              width: 142,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Rectangle Copy 6.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Thomson',
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontFamily: 'DMSans',
                      fontSize: 13,
                    ),
                  ),
                   Text(
                    '+090078601',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontFamily: 'DMSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom:20),
              margin: EdgeInsets.all(10),
            ),
            Container(
              height: 164,
              width: 142,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFFFFFF)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Rectangle Copy 8.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Zayn',
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontFamily: 'DMSans',
                      fontSize: 13,
                    ),
                  ),
                   Text(
                    '+090078601',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontFamily: 'DMSans',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.all(5),
            ),
          ],
        ),
      ),
    );
  }
}
