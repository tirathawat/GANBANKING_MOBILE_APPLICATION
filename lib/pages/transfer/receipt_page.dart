import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/pages/home/home_page.dart';
import 'package:ganbanking/widgets/default_button.dart';
import 'package:get/get.dart';

class ReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      body: SafeArea(
        child: Column(
          children: [
            _buildSuccessText(),
            SizedBox(
              height: getScreenHeight(45),
            ),
            _buildReceipt(),
            SizedBox(
              height: getScreenHeight(20),
            ),
            _buildFavButton(),
            SizedBox(
              height: getScreenHeight(80),
            ),
            _buildBackHomeButton(),
          ],
        ),
      ),
    );
  }

  Padding _buildBackHomeButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(40),
      ),
      child: Defaultbutton(
        onPress: () {
          Get.to(() => HomePage());
        },
        text: Text(
          'กลับหน้าหลัก',
          style: TextStyle(
            fontSize: getScreenWidth(20),
            color: Color(0xff000000),
          ),
        ),
        color: Colors.white,
      ),
    );
  }

  Padding _buildFavButton() {
    return Padding(
      padding: EdgeInsets.only(
        right: getScreenWidth(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 39,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0xff47AEFC),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'เพิ่มในรายการโปรด',
            style: TextStyle(
              fontSize: getScreenWidth(15),
              color: Color(0xffFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Stack _buildReceipt() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SvgPicture.asset(
          'assets/icons/bill.svg',
          height: getScreenHeight(454),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getScreenHeight(40),
              ),
              Center(
                child: Text(
                  'โอนเงินสำเร็จ',
                  style: TextStyle(
                    color: Color(0xff1C1939),
                    fontSize: getScreenWidth(20),
                  ),
                ),
              ),
              SizedBox(
                height: getScreenHeight(20),
              ),
              Center(
                child: Text(
                  '4 เม.ย. 64   22.19 น.',
                  style: TextStyle(
                    color: Color(0xff1C1939),
                    fontSize: getScreenWidth(17),
                  ),
                ),
              ),
              SizedBox(
                height: getScreenHeight(60),
              ),
              Text(
                'จาก',
                style: TextStyle(
                  color: Color(0xff9EA6BE),
                  fontSize: getScreenWidth(12),
                ),
              ),
              Text(
                'นายแกน มงคลากร',
                style: TextStyle(
                  color: Color(0xff1C1939),
                  fontSize: getScreenWidth(20),
                ),
              ),
              Text(
                'XXX-X-X888-X',
                style: TextStyle(
                  color: Color(0xff1C1939),
                  fontSize: getScreenWidth(13),
                ),
              ),
              SizedBox(
                height: getScreenHeight(20),
              ),
              Text(
                'ไปยัง',
                style: TextStyle(
                  color: Color(0xff9EA6BE),
                  fontSize: getScreenWidth(12),
                ),
              ),
              Text(
                'นายแกน มงคลากร',
                style: TextStyle(
                  color: Color(0xff1C1939),
                  fontSize: getScreenWidth(20),
                ),
              ),
              Text(
                'XXX-X-X888-X',
                style: TextStyle(
                  color: Color(0xff1C1939),
                  fontSize: getScreenWidth(13),
                ),
              ),
              SizedBox(
                height: getScreenHeight(25),
              ),
              Text(
                'เลขที่รายการ',
                style: TextStyle(
                  color: Color(0xff9EA6BE),
                  fontSize: getScreenWidth(12),
                ),
              ),
              Text(
                '9898989898989898',
                style: TextStyle(
                  color: Color(0xff1C1939),
                  fontSize: getScreenWidth(15),
                ),
              ),
              SizedBox(
                height: getScreenHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount sent',
                        style: TextStyle(
                          color: Color(0xff9EA6BE),
                          fontSize: getScreenWidth(12),
                        ),
                      ),
                      Text(
                        '199,000 บาท',
                        style: TextStyle(
                          color: Color(0xff1C1939),
                          fontSize: getScreenWidth(15),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ค่าธรรมเนียม',
                        style: TextStyle(
                          color: Color(0xff9EA6BE),
                          fontSize: getScreenWidth(12),
                        ),
                      ),
                      Text(
                        '0.00 บาท',
                        style: TextStyle(
                          color: Color(0xff1C1939),
                          fontSize: getScreenWidth(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Stack _buildSuccessText() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Assets.SUCCESS_BACKGROUND,
        ),
        Text(
          'สำเร็จ!',
          style: TextStyle(
            color: Color(0xffffffff),
            fontSize: getScreenWidth(20),
          ),
        ),
      ],
    );
  }
}
