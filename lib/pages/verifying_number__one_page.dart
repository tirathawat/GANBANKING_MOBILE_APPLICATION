import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';

class VerifyingNumberOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 62,
              ),
              Text(
                "เริ่มต้นใช้งาน",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "กรุณากรอกรหัสที่ได้รับ เพื่อเริ่มต้นใช้งาน",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 437,
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
                    'ยืนยัน',
                    style: TextStyle(
                      fontSize: getScreenWidth(17),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text.rich(TextSpan(
                  text: "by clicking start, you agree to our ",
                  children: <TextSpan>[
                    TextSpan(
                        text: "Privacy Policy ",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff1C75FF),
                        ))
                  ])),
              Text.rich(TextSpan(text: "our ", children: <TextSpan>[
                TextSpan(
                    text: "Teams and Conditions",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff1C75FF),
                    ))
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
