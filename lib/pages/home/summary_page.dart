import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SummaryPage extends StatelessWidget {
  final AccountAPI accountAPI = Get.find<AccountAPI>();

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
                  accountAPI.accounts.value == null
                      ? '0.00'
                      : '${NumberFormat.currency().format(accountAPI.accounts.value[accountAPI.selectedAccount.value].accountBalance).replaceAll("USD", "")}',
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
                "ข้อมูล ณ วันที่ 23 เม.ย 64",
                style: TextStyle(
                  fontSize: getScreenWidth(15),
                  color: Color(0xFF1C1939).withOpacity(.8),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CircularPercentIndicator(
                radius: 180.0,
                lineWidth: 5.0,
                percent: .8,
                center: Text(
                  "80%",
                  style: TextStyle(
                    fontSize: getScreenWidth(30),
                  ),
                ),
                progressColor: Colors.green,
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
                      'สรุปรายการย้อนหลัง ม.ค. 64 - เม.ย. 64',
                      style: TextStyle(
                        fontSize: getScreenWidth(14),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C1939).withOpacity(.8),
                      ),
                    ),
                    Row(
                      children: [
                        _buildIncomeComponent(
                          "รายจ่าย",
                          "1,460",
                          Color(0xFFFF5141),
                        ),
                        SizedBox(
                          width: 80,
                        ),
                        _buildIncomeComponent(
                          "รายรับ",
                          "2,730",
                          Color(0xFF44EF44),
                        ),
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

  _buildIncomeComponent(String title, String amount, Color color) {
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
              amount,
              style: TextStyle(
                fontSize: getScreenWidth(25),
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
        children: List.generate(10, (index) => _buildTransactionItem()),
      ),
    );
  }

  Container _buildTransactionItem() {
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
          SvgPicture.asset(
            Assets.WALLET,
            color: Color(0xFF003DFF),
          ),
          SizedBox(
            width: 35,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "รับเงิน",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenWidth(16),
                  color: Color(0xFF1C1939),
                ),
              ),
              Text(
                "4 transactions",
                style: TextStyle(
                  fontSize: getScreenWidth(15),
                  color: Color(0xFF1C1939).withOpacity(.8),
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            "200",
            style: TextStyle(
              fontSize: getScreenWidth(18),
              color: Color(0xFF1C1939),
            ),
          ),
        ],
      ),
    );
  }
}
