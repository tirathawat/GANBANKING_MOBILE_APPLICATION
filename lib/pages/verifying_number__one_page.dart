import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyingNumberOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 62,
              ),
              Text(
                "เริ่มต้นใช้งาน",
                style: TextStyle(
                  fontSize: getScreenWidth(35),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "กรุณากรอกรหัสที่ได้รับ เพื่อเริ่มต้นใช้งาน",
                style: TextStyle(
                  fontSize: getScreenWidth(15),
                ),
              ),
              SizedBox(
                height: 118,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(40),
                ),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.black,
                    activeColor: Colors.black,
                    disabledColor: Colors.black,
                    selectedColor: Colors.black,
                    inactiveColor: Colors.black,
                    inactiveFillColor: Colors.black,
                    selectedFillColor: Colors.black,
                  ),
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
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
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
