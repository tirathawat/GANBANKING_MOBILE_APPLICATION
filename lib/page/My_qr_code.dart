import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyQrCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  'My QR Code',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'DMSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              margin: EdgeInsets.only(top: 50),
            ),
            Stack(
              alignment: Alignment.topCenter, 
              children: [
              Container(
                child: Center(
                  child: SvgPicture.asset('assets/icons/Qr.svg',
                  width: 340,
                  height: 432.45,),
                ),
              ),
              Column(
                children: [
                  Container(
                      child: Text(
                        'บัญชี',
                        style: TextStyle(
                            color: Color(0xff9EA6BE),
                            fontFamily: 'Thasadith',
                            fontSize: 12),
                      ),
                      margin: EdgeInsets.fromLTRB(69, 45, 280, 0),
                    ),
                    Container(
                      child: Text(
                        'นายแกน มงคลากร',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 20),
                      ),
                      margin: EdgeInsets.fromLTRB(75, 0, 175, 0),
                    ),
                    Container(
                      child: Text(
                        'XXX-X-X888-X',
                        style: TextStyle(
                            color: Color(0xff1C1939),
                            fontFamily: 'Thasadith',
                            fontSize: 13),
                      ),
                      margin: EdgeInsets.fromLTRB(25, 0, 175, 0),
                    ),
                    Container(
                      child: SvgPicture.asset('assets/icons/QeCode.svg',
                      width: 180,
                      height: 180,),
                      margin: EdgeInsets.fromLTRB(45, 44, 47, 50),
                    ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
