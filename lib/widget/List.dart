import 'package:flutter/material.dart';

class ListPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 25),
      children: <Widget>[
      ListTile(
        title: Text(
          "Hailey Sanders",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Thasadith',
            color: Color(0xff1C1939),
          ),
        ),
        subtitle: Text(
          '+090078601',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff9EA6BE),
            fontFamily: 'Thasadith',
          ),
        ),
        trailing: Container(
          child: Container(
            width: 73,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff9EA6BE),
            ),
            child: Container(
              child: Text(
                'โอนเงิน',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Thasadith',
                  color: Color(0xffFFFFFF),
                ),
              ),
              padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            ),
          ),
        ),
      ),
      Divider(
        height: 0.25,
        color: Color(0xffD2D1D7),
      ),
      ListTile(
        title: Text(
          "Zayn Michel",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Thasadith',
            color: Color(0xff1C1939),
          ),
        ),
        subtitle: Text(
          '+090078601',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff9EA6BE),
            fontFamily: 'Thasadith',
          ),
        ),
        trailing: Container(
          child: Container(
            width: 73,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff9EA6BE),
            ),
            child: Container(
              child: Text(
                'โอนเงิน',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Thasadith',
                  color: Color(0xffFFFFFF),
                ),
              ),
              padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            ),
          ),
        ),
      ),
      Divider(
        height: 0.25,
        color: Color(0xffD2D1D7),
      ),
      ListTile(
        title: Text(
          "Thomas Denver",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Thasadith',
            color: Color(0xff1C1939),
          ),
        ),
        subtitle: Text(
          '+090078601',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff9EA6BE),
            fontFamily: 'Thasadith',
          ),
        ),
        trailing: Container(
          child: Container(
            width: 73,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff9EA6BE),
            ),
            child: Container(
              child: Text(
                'โอนเงิน',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Thasadith',
                  color: Color(0xffFFFFFF),
                ),
              ),
              padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            ),
          ),
        ),
      ),
      Divider(
        height: 0.25,
        color: Color(0xffD2D1D7),
      ),
      ListTile(
        title: Text(
          "Hailey Sanders",
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Thasadith',
            color: Color(0xff1C1939),
          ),
        ),
        subtitle: Text(
          '+090078601',
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff9EA6BE),
            fontFamily: 'Thasadith',
          ),
        ),
        trailing: Container(
          child: Container(
            width: 73,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff9EA6BE),
            ),
            child: Container(
              child: Text(
                'โอนเงิน',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Thasadith',
                  color: Color(0xffFFFFFF),
                ),
              ),
              padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            ),
          ),
        ),
      ),
      Divider(
        height: 0.25,
        color: Color(0xffD2D1D7),
      ),
    ]);
  }
}
