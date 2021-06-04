import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/controllers/variable_controller.dart';
import 'package:ganbanking/pages/auth/3_sign_in_page_2.dart';
import 'package:get/get.dart';

import '5_mobile_number_page.dart';

class SignInPage1 extends StatelessWidget {
  final VariableController variableController = Get.put(VariableController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                    width: 245.5,
                    height: 245.5,
                    child: Image.asset('assets/images/money-transfer.png')),
                SizedBox(
                  height: 84,
                ),
                Text(
                  "ธนาคารออนไลน์",
                  style: TextStyle(
                      fontSize: getScreenWidth(35),
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff)),
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  "ใช้งานจากที่ไหนก็ได้ ทุกที่ทั่วโลก",
                  style: TextStyle(
                    fontSize: getScreenWidth(15),
                    color: Color(0xffffffff),
                  ),
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
                    onPressed: () {
                      Get.to(() => SignInPage2());
                    },
                    child: Text(
                      'ต่อไป',
                      style: TextStyle(
                        fontSize: getScreenWidth(17),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: getScreenWidth(40),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => MobileNumberPage());
                    },
                    child: Text(
                      'ข้าม',
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
      ),
    );
  }
}
