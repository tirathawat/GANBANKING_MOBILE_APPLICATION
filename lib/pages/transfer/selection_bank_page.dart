import 'package:flutter/material.dart';
import 'package:ganbanking/apis/bank_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:get/get.dart';

class SelectionBankPage extends StatelessWidget {
  final BankAPI bankAPI = Get.find<BankAPI>();
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
        () => bankAPI.bank.value == null
            ? SizedBox()
            : ListView(
                children: List.generate(bankAPI.bank.value.length, (index) {
                  var data = bankAPI.bank.value[index];
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
        bankAPI.selectedBank.value = index;
        Get.back();
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
