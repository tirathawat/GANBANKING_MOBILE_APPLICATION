import 'package:flutter/material.dart';
import 'package:ganbanking/apis/customer_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/controllers/variable_controller.dart';
import 'package:ganbanking/services/firebase_service.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class MobileNumberPage extends StatelessWidget {
  final VariableController variableController = Get.put(VariableController());

  final RxBool _validated = false.obs;
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
                "เบอร์โทร",
                style: TextStyle(
                  fontSize: getScreenWidth(35),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "กรุณากรอกเบอร์โทรศัพท์ เพื่อใช้ในการยืนยันตัวตน",
                style: TextStyle(
                  fontSize: getScreenWidth(15),
                ),
              ),
              SizedBox(
                height: 85,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(40),
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {},
                  onInputValidated: (bool value) {
                    print("VALIDATE PHONE : $value");
                    _validated.value = value;
                    //TODO remove this
                    if (variableController.phoneController.text == '0123456789')
                      _validated.value = true;
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  initialValue: PhoneNumber(isoCode: 'TH'),
                  ignoreBlank: false,
                  cursorColor: Color(0xFF1C75FF),
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  formatInput: true,
                  textFieldController: variableController.phoneController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              SizedBox(
                height: 107,
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
                  onPressed: _onPressSend,
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

  void _onPressSend() async {
    if (_validated.value) {
      Get.dialog(CustomProgressIndicator());

      bool hasCustomer = await CustomerAPI.hasCustomer(
          variableController.phoneController.text.replaceFirst("+66", "0"));

      if (hasCustomer) {
        await FirebaseService.requestOtp(
            variableController.phoneController.text);
      } else {
        Get.back();
        Get.snackbar("แจ้งเตือน", "ท่านยังไม่ได้ทำการเปิดบัญชี");
      }
    } else {
      Get.snackbar("แจ้งเตือน", "เบอร์โทรไม่ถูกต้อง");
    }
  }
}
