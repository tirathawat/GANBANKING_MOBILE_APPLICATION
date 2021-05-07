import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceiptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: Center(child: SvgPicture.asset('assets/icons/Ss.svg')),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'สำเร็จ!',
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Thasadith',
                          fontSize: 20),
                    ),
                  ),
                  margin: EdgeInsets.only(top: 56.2),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  child: Center(
                    child: SvgPicture.asset('assets/icons/bill.svg'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'โอนเงินสำเร็จ',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 20),
                      ),
                      margin: EdgeInsets.fromLTRB(132, 45, 130, 0),
                    ),
                    Container(
                      child: Text(
                        '4 เม.ย. 64   22.19 น.',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 17),
                      ),
                      margin: EdgeInsets.fromLTRB(115, 18, 115, 0),
                    ),
                    Container(
                      child: Text(
                        'จาก',
                        style: TextStyle(
                            color: Color(0xff9EA6BE),
                            fontFamily: 'Thasadith',
                            fontSize: 12),
                      ),
                      margin: EdgeInsets.fromLTRB(26, 69, 313, 0),
                    ),
                    Container(
                      child: Text(
                        'นายแกน มงคลากร',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 20),
                      ),
                      margin: EdgeInsets.fromLTRB(26, 0, 198, 0),
                    ),
                    Container(
                      child: Text(
                        'XXX-X-X888-X',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 13),
                      ),
                      margin: EdgeInsets.fromLTRB(28, 0, 248, 0),
                    ),
                    Container(
                      child: Text(
                        'ไปยัง',
                        style: TextStyle(
                            color: Color(0xff9EA6BE),
                            fontFamily: 'Thasadith',
                            fontSize: 12),
                      ),
                      margin: EdgeInsets.fromLTRB(26, 19.4, 313, 0),
                    ),
                    Container(
                      child: Text(
                        'นายแกน มงคลากร',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 20),
                      ),
                      margin: EdgeInsets.fromLTRB(26, 0, 198, 0),
                    ),
                    Container(
                      child: Text(
                        'XXX-X-X888-X',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 13),
                      ),
                      margin: EdgeInsets.fromLTRB(28, 0, 248, 0),
                    ),
                    Container(
                      child: Text(
                        'เลขที่รายการ',
                        style: TextStyle(
                            color: Color(0xff9EA6BE),
                            fontFamily: 'Thasadith',
                            fontSize: 12),
                      ),
                      margin: EdgeInsets.fromLTRB(26, 25.9, 277, 0),
                    ),
                    Container(
                      child: Text(
                        '9898989898989898',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 15),
                      ),
                      margin: EdgeInsets.fromLTRB(24, 5.5, 196, 0),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Text(
                                'Amount sent',
                                style: TextStyle(
                                    color: Color(0xff9EA6BE),
                                    fontFamily: 'Thasadith',
                                    fontSize: 12),
                              ),
                              margin: EdgeInsets.fromLTRB(24, 8, 0, 0),
                            ),
                            Container(
                              child: Text(
                                '199,000 บาท',
                                style: TextStyle(
                                    color: Color(0xff1C1939),
                                    fontFamily: 'Thasadith',
                                    fontSize: 15),
                              ),
                              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                'ค่าธรรมเนียม',
                                style: TextStyle(
                                    color: Color(0xff9EA6BE),
                                    fontFamily: 'Thasadith',
                                    fontSize: 12),
                              ),
                              margin: EdgeInsets.fromLTRB(14, 8, 0, 0),
                            ),
                            Container(
                              child: Text(
                                '0.00 บาท',
                                style: TextStyle(
                                    color: Color(0xff1C1939),
                                    fontFamily: 'Thasadith',
                                    fontSize: 15),
                              ),
                              margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 39,
                  height: 37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color(0xff47AEFC),
                  ),
                  margin: EdgeInsets.fromLTRB(235, 13, 0, 0),
                ),
                Container(
                  child: Text(
                    'เพิ่มในรายการโปรด',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xffFFFFFF),
                      fontFamily: 'Thasadith',
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(9, 15, 0, 0),
                ),
              ],
            ),
            Container(
              width: 340,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffffffff),
              ),
              margin: EdgeInsets.fromLTRB(37, 20, 37, 42.5),
              child: Center(
                child: Text(
                  'กลับหน้าหลัก',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff000000),
                    fontFamily: 'Thasadith',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
