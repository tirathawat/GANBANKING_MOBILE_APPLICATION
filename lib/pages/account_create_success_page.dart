import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/pages/set_password_page.dart';
import 'package:get/get.dart';

class AccountCreateSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            SvgPicture.asset(Assets.LIKE),
            SizedBox(
              height: 80,
            ),
            Text(
              "สำเร็จ!",
              style: TextStyle(
                fontSize: getScreenWidth(35),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              "บัญชีของท่านพร้อมเเล้ว สามารถดำเนินการต่อเพื่อ\nเข้าสู่แอพพลิเคชั่น",
              style: TextStyle(
                fontSize: getScreenWidth(15),
                color: Color(0xFF1C1939).withOpacity(.8),
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
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
                  backgroundColor: MaterialStateProperty.all(Color(0xff1C75FF)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                ),
                onPressed: () {
                  Get.to(SetPasswordPage());
                },
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
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
