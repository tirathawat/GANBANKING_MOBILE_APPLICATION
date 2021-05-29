import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';

class MobileNumberPage extends StatelessWidget {
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
                "เบอร์โทร",
                style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "กรุณากรอกเบอร์โทรศัพท์ เพื่อใช้ในการยืนยันตัวตน",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Thasadith',
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 242,
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
                    'ส่งรหัสผ่าน',
                    style: TextStyle(
                      fontSize: getScreenWidth(17),
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
