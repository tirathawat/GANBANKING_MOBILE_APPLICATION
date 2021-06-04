import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/apis/bank_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/controllers/transfer_controller.dart';
import 'package:ganbanking/pages/transfer/comfirm_transfering_page.dart';
import 'package:ganbanking/pages/transfer/selection_bank_page.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:ganbanking/widgets/default_button.dart';
import 'package:get/get.dart';
import 'package:text_input_mask_formatter/text_input_mask_formatter.dart';

class SecondTransferingPage extends StatelessWidget {
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  final BankAPI bankAPI = Get.find<BankAPI>();
  final TransferController transferController = Get.put(TransferController());
  RxString inputValue = ''.obs;
  RxString unmaskedInputValue = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("โอนเงิน"),
      backgroundColor: Color(0xff1C75FF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(35),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'จาก',
                style: TextStyle(
                  fontSize: getScreenWidth(20),
                  color: Color(0xffFFFFFF),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "บัญชีออมทรัพย์",
                          style: TextStyle(
                            fontSize: getScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Text(
                            accountAPI.accounts.value == null
                                ? ""
                                : Util.formatAccountNo(accountAPI
                                    .accounts
                                    .value[accountAPI.selectedAccount.value]
                                    .accountNo
                                    .toString()),
                            style: TextStyle(
                              fontSize: getScreenWidth(16),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ยอดเงิน",
                          style: TextStyle(
                            fontSize: getScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "295,900 บาท",
                          style: TextStyle(
                            fontSize: getScreenWidth(16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'ไปยัง',
            style: TextStyle(
              fontSize: getScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildBankSelector(),
          SizedBox(
            height: 20,
          ),
          Text(
            'เลขที่บัญชี',
            style: TextStyle(
              fontSize: getScreenWidth(16),
              color: Color(0xff000000),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildAccountNoTo(),
          SizedBox(
            height: 10,
          ),
          Text(
            'จำนวน',
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: getScreenWidth(16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildAmountForm(),
          SizedBox(
            height: 10,
          ),
          Text(
            'บันทึก',
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: getScreenWidth(16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _buildMemoForm(),
          Spacer(),
          Defaultbutton(
            onPress: () async {
              if (transferController.accountNoTo.text.length != 12 ||
                  transferController.amount.text == '') {
                Get.snackbar("แจ้งเตือน", "เลขบัญชีหรือจำนวนเงินไม่ถูกต้อง");
              } else {
                Get.dialog(CustomProgressIndicator());
                await accountAPI
                    .getAccountByID(
                        transferController.accountNoTo.text.replaceAll("-", ""),
                        bankAPI.bank.value[bankAPI.selectedBank.value].bankId)
                    .then((value) {
                  Get.back();

                  if (value) {
                    Get.to(() => ConfirmTransferingPage());
                  } else {
                    Get.snackbar("แจ้งเตือน", "ไม่พบบัญชีปลายทาง");
                  }
                }).onError((error, stackTrace) {
                  Get.back();
                  print(error.message);
                  Get.snackbar("แจ้งเตือน", "เกิดข้อผิดพลาด");
                });
              }
            },
            text: Text(
              'ตรวจสอบความถูกต้อง',
              style: TextStyle(
                fontSize: getScreenWidth(20),
                color: Color(0xffFFFFFF),
              ),
            ),
            color: Color(0xff1C75FF),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  TextFormField _buildMemoForm() {
    return TextFormField(
      style: TextStyle(
        fontSize: getScreenWidth(18),
        color: Colors.black,
      ),
      maxLines: 3,
      controller: transferController.memo,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextFormField _buildAmountForm() {
    return TextFormField(
      style: TextStyle(
        fontSize: getScreenWidth(18),
        color: Colors.black,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      controller: transferController.amount,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextFormField _buildAccountNoTo() {
    return TextFormField(
      inputFormatters: [
        MaskTextInputFormatter('___-_-____-_'),
        LengthLimitingTextInputFormatter(12),
      ],
      style: TextStyle(
        fontSize: getScreenWidth(18),
        color: Colors.black,
      ),
      onChanged: (s) {
        inputValue.value = s;
        unmaskedInputValue.value =
            MaskTextInputFormatter('___-_-____-_').getEscapedString(s);
      },
      cursorColor: Colors.black,
      controller: transferController.accountNoTo,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _buildBankSelector() {
    return InkWell(
      onTap: () {
        Get.to(() => SelectionBankPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Color(int.parse(
                  "0xFF${bankAPI.bank.value[bankAPI.selectedBank.value].bankColor}"))
              .withOpacity(.26),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              bankAPI.bank.value[bankAPI.selectedBank.value].bankLogo,
              style: TextStyle(
                fontSize: getScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Color(0xFF003DFF),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              bankAPI.bank.value[bankAPI.selectedBank.value].bankName,
              style: TextStyle(
                fontSize: getScreenWidth(15),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
