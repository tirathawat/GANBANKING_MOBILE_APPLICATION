import 'package:flutter/material.dart';
class BluePlus2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 400,
        height: 174,
        margin: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Color(0xff1C75FF)),
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Container(
                child: Text(
                  'โอนเงิน',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Thasadith',
                      color: Color(0xffFFFFFF)),
                ),
              ),
              Container(
                child: Text(
                  "จาก",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Thasadith',
                    color: Color(0xffFFFFFF),
                  ),
                ),
                margin: EdgeInsets.only(right: 313, left: 37),
              ),
              Container(
                width: 340,
                height: 90,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.fromLTRB(37, 8, 37, 8),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "บัญชีออมทรัพย์",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Thasadith',
                              color: Color(0xff1C1939),
                            ),
                          ),
                          margin: EdgeInsets.only(left: 27, top: 20),
                        ),
                        Container(
                          child: Text(
                            "XXX-X-X888-X",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Thasadith',
                              color: Color(0xff1C1939),
                            ),
                          ),
                          margin:
                              EdgeInsets.only(left: 27, top: 7.8, bottom: 22.4),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "ยอดเงิน",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Thasadith',
                              color: Color(0xff1C1939),
                            ),
                          ),
                          margin:
                              EdgeInsets.only(left: 62, top: 27.9, right: 8),
                        ),
                        Container(
                          child: Text(
                            "295,900 บาท",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Thasadith',
                              color: Color(0xff1C1939),
                            ),
                          ),
                          margin: EdgeInsets.only(
                            left: 88,
                            top: 4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
