import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';

class SignInPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                  width: 245.5,
                  height: 245.5,
                  child: Image.asset('assets/images/handshake.png')),
              SizedBox(
                height: 84,
              ),
              Text(
                "เชื่อมต่อกับทุกคน ทั่วโลก",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.w900,
                    color: Color(0xffffffff)),
              ),
              SizedBox(
                height: 21,
              ),
              Text(
                "ให้การเชื่อมต่อของคุณ ปลอดภัย เเละทั่วถึง",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.w900,
                    color: Color(0xffffffff)),
              ),
              SizedBox(
                height: 84,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(40),
                ),
                child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 0)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffffffff)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  onPressed: () {},
                  child: Text(
                    'เริ่มต้นใช้งาน',
                    style: TextStyle(
                      fontSize: getScreenWidth(17),
                      color: Color(0xff1C75FF),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(40),
                ),
                child: OutlinedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 0)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff1C75FF)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  ),
                  onPressed: () {},
                  child: Text(
                    'เข้าสู่ระบบด้วยเบอร์โทรศัพท์',
                    style: TextStyle(
                      fontSize: getScreenWidth(17),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
