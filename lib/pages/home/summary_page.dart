import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/constants/constants.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SummaryPage extends StatelessWidget {
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  final AppController appController = Get.find<AppController>();
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37),
          child: Column(
            children: [
              Text(
                "ยอดเงินคงเหลือ",
                style: TextStyle(
                  fontSize: getScreenWidth(17),
                  color: Color(0xFF1C1939),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(
                () => Text(
                  appController.accounts.value == null
                      ? '0.00'
                      : '${NumberFormat.currency().format(appController.accounts.value[appController.selectedAccount.value].accountBalance).replaceAll("USD", "")}',
                  style: TextStyle(
                    fontSize: getScreenWidth(35),
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.8),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "ข้อมูล ณ วันที่ ${DateTime.now().day} ${Constants.SHORT_MONTH_TH[DateTime.now().month - 1]} ${DateTime.now().year + 543}",
                style: TextStyle(
                  fontSize: getScreenWidth(15),
                  color: Color(0xFF1C1939).withOpacity(.8),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Obx(
                () {
                  double income, outcome;
                  if (appController.transactions.value == null) {
                    income = 0;
                    outcome = 0;
                  }
                  income = appController
                      .transactions.value.incomeOutcome[0].incomeCurrentMonth;
                  outcome = appController
                      .transactions.value.incomeOutcome[0].outcomeCurrentMonth;
                  return CircularPercentIndicator(
                    radius: 180.0,
                    lineWidth: 5.0,
                    percent: _calculatePercent(income, outcome),
                    center: Text(
                      income > outcome
                          ? "รายรับต่อรายจ่าย"
                          : "รายจ่ายต่อรายรับ",
                      style: TextStyle(
                        fontSize: getScreenWidth(20),
                      ),
                    ),
                    progressColor: income > outcome ? Colors.green : Colors.red,
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 26),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 8,
                      blurRadius: 10,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      'สรุปรายการย้อนหลัง ${Constants.SHORT_MONTH_TH[DateTime.now().month - 1]} ${DateTime.now().year + 543} - ${Constants.SHORT_MONTH_TH[DateTime.now().month]} ${DateTime.now().year + 543}',
                      style: TextStyle(
                        fontSize: getScreenWidth(14),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C1939).withOpacity(.8),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Obx(() => _buildIncomeComponent(
                              "รายจ่าย",
                              appController.transactions.value == null
                                  ? 0
                                  : appController.transactions.value
                                      .incomeOutcome[0].outcomeCurrentMonth,
                              Color(0xFFFF5141),
                            )),
                        Spacer(),
                        Obx(() => _buildIncomeComponent(
                              "รายรับ",
                              appController.transactions.value == null
                                  ? 0
                                  : appController.transactions.value
                                      .incomeOutcome[0].incomeCurrentMonth,
                              Color(0xFF44EF44),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ยอดใช้จ่ายรายประเภท",
                  style: TextStyle(
                    fontSize: getScreenWidth(18),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2A2838),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildTransactionList(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  _buildIncomeComponent(String title, double amount, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: 10,
          ),
          height: 10.0,
          width: 10.0,
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: getScreenWidth(13),
                color: Color(hexColor('#1C1939')),
              ),
            ),
            Text(
              NumberFormat.currency().format(amount).replaceAll("USD", ""),
              style: TextStyle(
                fontSize: getScreenWidth(18),
                color: Color(hexColor('#1C1939')),
              ),
            ),
          ],
        )
      ],
    );
  }

  _buildTransactionList() {
    return Expanded(
      child: ListView(
        children: List.generate(
            appController.transactions.value.transaction.length, (index) {
          var data = appController.transactions.value.transaction[index];
          return _buildTransactionItem(data.transactionTypeName,
              data.transactionAmount, data.transactionTimestamp);
        }),
      ),
    );
  }

  Container _buildTransactionItem(String type, double amount, DateTime date) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(bottom: 30, top: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD2D1D7),
          ),
        ),
      ),
      child: Row(
        children: [
          type == "โอน"
              ? SizedBox(
                  width: 20,
                  child: Center(
                    child: Transform.rotate(
                      angle: 7 * pi / 4,
                      child: SvgPicture.asset(
                        Assets.SEND,
                        color: Color(0xFF003DFF),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 20,
                  child: SvgPicture.asset(
                    Assets.WALLET,
                    color: Color(0xFF003DFF),
                  ),
                ),
          SizedBox(
            width: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenWidth(16),
                  color: Color(0xFF1C1939),
                ),
              ),
              Text(
                "${date.day} ${Constants.SHORT_MONTH_TH[date.month - 1]} ${date.year + 543}",
                style: TextStyle(
                  fontSize: getScreenWidth(15),
                  color: Color(0xFF1C1939).withOpacity(.8),
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            NumberFormat.currency().format(amount).replaceAll("USD", ""),
            style: TextStyle(
              fontSize: getScreenWidth(18),
              color: Color(0xFF1C1939),
            ),
          ),
        ],
      ),
    );
  }

  _calculatePercent(double income, double outcome) {
    if (income > outcome) {
      return income / (income + outcome);
    } else {
      return outcome / (income + outcome);
    }
  }
}
