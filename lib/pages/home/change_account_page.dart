import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_page.dart';

class ChangeAccountPage extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      appBar: _buildAppBar(),
      body: ListView(
          children: List.generate(
              appController.accounts.value.length,
              (index) => _buildAccountItem(
                  index,
                  appController.accounts.value[index].accountNo,
                  appController.accounts.value[index].accountBalance))),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "บัญชี",
        style: TextStyle(
          fontSize: getScreenWidth(20),
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }

  _buildAccountItem(int index, int accountNo, double balance) {
    return GestureDetector(
      onTap: () async {
        appController.selectedAccount.value = index;
        Get.dialog(CustomProgressIndicator());
        await accountAPI.getTransaction().then((value) {
          Get.off(() => HomePage());
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 37,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 8,
              blurRadius: 10,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "บัญชีออมทรัพย์",
              style: TextStyle(
                fontSize: getScreenWidth(16),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              Util.formatAccountNo(accountNo.toString()),
              style: TextStyle(
                fontSize: getScreenWidth(13),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(color: Color(0xFF979797)),
            SizedBox(
              height: 10,
            ),
            Text(
              "ยอดเงิน",
              style: TextStyle(
                fontSize: getScreenWidth(13),
              ),
            ),
            Text(
              "${NumberFormat.currency().format(balance).replaceAll("USD", "")} บาท",
              style: TextStyle(
                fontSize: getScreenWidth(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
