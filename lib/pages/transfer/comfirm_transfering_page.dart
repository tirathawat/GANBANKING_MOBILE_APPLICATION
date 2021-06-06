import 'package:flutter/material.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/apis/bank_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/controllers/transfer_controller.dart';
import 'package:ganbanking/pages/transfer/receipt_page.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:ganbanking/widgets/default_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConfirmTransferingPage extends StatelessWidget {
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  final TransferController transferController = Get.find<TransferController>();
  final BankAPI bankAPI = Get.find<BankAPI>();
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          _buildTransfer(
              "จาก",
              "G",
              appController.accounts.value[appController.selectedAccount.value]
                  .accountName,
              appController
                  .accounts.value[appController.selectedAccount.value].accountNo
                  .toString(),
              "003DFF"),
          Divider(
            height: 30,
          ),
          _buildTransfer(
            "ไปยัง",
            appController.accountInfo.value.bankLogo,
            appController.accountInfo.value.accountName,
            appController.accountInfo.value.accountNo.toString(),
            appController.accountInfo.value.bankColor,
          ),
          Divider(
            height: 30,
          ),
          _buildDetail(
              "จำนวนเงิน",
              NumberFormat.currency()
                  .format(double.parse(transferController.amount.text))
                  .replaceAll("USD", "")),
          Divider(
            height: 30,
          ),
          _buildDetail("ค่าธรรมเนียม", "0.00"),
          Divider(
            height: 30,
          ),
          _buildDetail("บันทึกช่วยจำ", transferController.memo.text),
          Divider(
            height: 30,
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(40),
            ),
            child: Defaultbutton(
              onPress: () async {
                Get.dialog(
                  CustomProgressIndicator(),
                  barrierDismissible: false,
                );
                await accountAPI
                    .transfer(
                        int.parse(transferController.accountNoTo.text
                            .replaceAll("-", "")),
                        double.parse(transferController.amount.text),
                        appController.bank
                            .value[appController.selectedBank.value].bankId,
                        transferController.memo.text)
                    .then((value) {
                  Get.back();
                  if (value != null) {
                    Get.to(() => ReceiptPage(ref: value));
                  } else {
                    Get.snackbar("แจ้งเตือน", "เกิดข้อผิดพลาดในการทำรายการ");
                  }
                });
              },
              text: Text(
                'ยืนยัน',
                style: TextStyle(
                  fontSize: getScreenWidth(20),
                  color: Color(0xffFFFFFF),
                ),
              ),
              color: Color(0xff1C75FF),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  _buildTransfer(String title, String bankLogo, String accountName,
      String accountNo, String color) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    bankLogo,
                    style: TextStyle(
                      fontSize: getScreenWidth(30),
                      color: Color(
                        int.parse("0xFF$color"),
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(accountName),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(Util.formatAccountNo(accountNo)),
            ],
          ),
        ],
      ),
    );
  }

  _buildDetail(String title, String detail) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(40),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Spacer(),
          Text(detail),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "ตรวจสอบข้อมูล",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
