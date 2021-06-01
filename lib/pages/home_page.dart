import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/pages/change_account_page.dart';
import 'package:ganbanking/pages/first_transfering_page.dart';
import 'package:ganbanking/pages/my_qrcode_page.dart';
import 'package:ganbanking/pages/auth/sign_in_page_1.dart';
import 'package:ganbanking/pages/summary_page.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildBlueContainer(),
          _buildContent(),
        ],
      ),
    );
  }

  _buildBlueContainer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
      ),
      width: double.infinity,
      color: Color(hexColor('#1C75FF')),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ยอดเงินคงเหลือ",
                  style: TextStyle(
                    fontSize: getScreenWidth(15),
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(SignInPage1());
                  },
                  child: SvgPicture.asset(
                    Assets.LOGOUT,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '\n7,425',
                      style: TextStyle(
                        fontSize: getScreenWidth(35),
                        color: Color(hexColor('#FFFFFF')),
                      )),
                  TextSpan(
                      text: ' บาท',
                      style: TextStyle(
                        fontSize: getScreenWidth(25),
                        color: Color(hexColor('#FFFFFF')),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "บัญชีออมทรัพย์ XXX-X-X3666-X",
                  style: TextStyle(
                    fontSize: getScreenWidth(15),
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(ChangeAccountPage());
                  },
                  child: Text(
                    "เปลี่ยนบัญชี",
                    style: TextStyle(
                      fontSize: getScreenWidth(15),
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: Color(hexColor('#F9F9FB')),
                borderRadius: const BorderRadius.all(const Radius.circular(8)),
              ),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }

  _buildContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 20,
        ),
        color: Color(0xFFECECEF),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ธุรกรรม",
                style: TextStyle(
                  fontSize: getScreenWidth(17),
                  color: Color(0xFF1C1939),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMenuBox(
                    "โอนเงิน",
                    SvgPicture.asset(Assets.WALLET),
                    FirstTransferingPage(),
                  ),
                  _buildMenuBox(
                    "My QRcode",
                    SvgPicture.asset(
                      Assets.QRCODE,
                      color: Colors.white,
                    ),
                    MyQrCodePage(),
                  ),
                  _buildMenuBox(
                    "สรุปรายการ",
                    SvgPicture.asset(Assets.STAT),
                    SummaryPage(),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "โปรโมชั่น",
                style: TextStyle(
                  fontSize: getScreenWidth(17),
                  color: Color(0xFF1C1939),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildPromotion(),
            ],
          ),
        ),
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

  _buildMenuBox(String text, Widget icon, dynamic page) {
    return InkWell(
      onTap: () {
        Get.to(page);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: getScreenHeight(20),
        ),
        width: getScreenWidth(107),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: getScreenWidth(38),
              height: getScreenWidth(38),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFF1B70F6),
              ),
              child: icon,
            ),
            SizedBox(
              height: 23,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: getScreenWidth(13),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPromotion() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
      ),
      child: Column(
        children: [
          SvgPicture.asset(Assets.PROMOTION),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ไก่ทอดฟรี",
                  style: TextStyle(
                    fontSize: getScreenWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "เพียงเเค่จ่ายด้วย G Bank รับไปเลยไก่ทอดสิบสองตัวฟรี!",
                  style: TextStyle(
                    fontSize: getScreenWidth(13),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
