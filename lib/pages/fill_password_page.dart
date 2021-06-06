import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ganbanking/apis/customer_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/models/account_model.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class FillPasswordPage extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final AppController appController = Get.find<AppController>();
  FillPasswordPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 62,
                ),
                Text(
                  "กรอกรหัสผ่าน",
                  style: TextStyle(
                    fontSize: getScreenWidth(35),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "สำหรับใช้ในการทำธุรกรรม",
                  style: TextStyle(
                    fontSize: getScreenWidth(15),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getScreenWidth(40),
                  ),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: true,
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
                    controller: passwordController,
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
                    onPressed: _onPressButton,
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
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressButton() async {
    if (passwordController.text.length != 6) {
      Get.snackbar("แจ้งเตือน", "กรุณากรอกรหัสผ่านจำนวน 6 หลัก");
    } else {
      Get.dialog(
        CustomProgressIndicator(),
        barrierDismissible: false,
      );
      await CustomerAPI.createCustomerSession(
              FirebaseAuth.instance.currentUser.phoneNumber
                  .replaceAll("+66", "0"),
              passwordController.text)
          .then((value) async {
        Get.back();
        if (value != null) {
          appController.accounts.value = accountModelFromJson(value);
          Get.back();
        } else {
          Get.snackbar("แจ้งเตือน", "เกิดข้อผิดพลาด");
        }
      });
    }
  }
}
