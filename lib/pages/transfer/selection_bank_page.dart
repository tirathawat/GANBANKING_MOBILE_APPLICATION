import 'package:flutter/material.dart';
import 'package:ganbanking/apis/bank_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/pages/transfer/second_transfering_page.dart';
import 'package:get/get.dart';

class SelectionBankPage extends StatelessWidget {
  final BankAPI bankAPI = Get.find<BankAPI>();
  final AppController appController = Get.find<AppController>();
  final bool gotoTransfer;

  SelectionBankPage({Key key, this.gotoTransfer = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Bank",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => appController.bank.value == null
            ? SizedBox()
            : ListView(
                children:
                    List.generate(appController.bank.value.length, (index) {
                  var data = appController.bank.value[index];
                  return _buildBankItem(
                      index, data.bankName, data.bankColor, data.bankLogo);
                }),
              ),
      ),
    );
  }

  _buildBankItem(int index, String name, String colorCode, String icon) {
    return GestureDetector(
      onTap: () {
        appController.selectedBank.value = index;
        if (gotoTransfer) {
          Get.to(() => SecondTransferingPage());
        } else {
          Get.back();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(.5)),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              icon,
              style: TextStyle(
                fontSize: getScreenWidth(35),
                fontWeight: FontWeight.bold,
                color: Color(
                  int.parse("0xFF$colorCode"),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: getScreenWidth(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
