import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/apis/bank_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/constants/constants.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/controllers/transfer_controller.dart';
import 'package:ganbanking/pages/home/home_page.dart';
import 'package:ganbanking/widgets/default_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReceiptPage extends StatelessWidget {
  final String ref;
  final TransferController transferController = Get.find<TransferController>();
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  final AppController appController = Get.find<AppController>();
  final RxBool _isFav = false.obs;

  ReceiptPage({Key key, @required this.ref}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var k = appController.accountInfo.value.accountNo.toString() +
        "_" +
        appController.accountInfo.value.bankId.toString();
    var f = appController.preferences.getBool(k);
    if (f == null) {
      appController.preferences.setBool(k, false);
    } else {
      _isFav.value = f;
    }

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
            _buildFavButton(k),
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
          Get.offAll(() => HomePage()).then((value) {
            Get.put(BankAPI());
            Get.put(AccountAPI());
          });
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

  _buildFavButton(String k) {
    return GestureDetector(
      onTap: () {
        _isFav.value = !_isFav.value;
        appController.preferences.setBool(k, _isFav.value);
      },
      child: Padding(
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
              child: Center(
                  child: Obx(
                () => !_isFav.value
                    ? SizedBox()
                    : Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                      ),
              )),
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
                  '${DateTime.now().day} ${Constants.SHORT_MONTH_TH[DateTime.now().month - 1]} ${DateTime.now().year + 543}   ${DateFormat.Hm().format(DateTime.now())} น.',
                  style: TextStyle(
                    color: Color(0xff1C1939),
                    fontSize: getScreenWidth(17),
                  ),
                ),
              ),
              SizedBox(
                height: getScreenHeight(60),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'จาก',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        appController
                            .accounts
                            .value[appController.selectedAccount.value]
                            .accountName,
                        style: TextStyle(
                          color: Color(0xff1C1939),
                          fontSize: getScreenWidth(20),
                        ),
                      ),
                      Text(
                        Util.formatAccountNo(appController
                            .accounts
                            .value[appController.selectedAccount.value]
                            .accountNo
                            .toString()),
                        style: TextStyle(
                          color: Color(0xff1C1939),
                          fontSize: getScreenWidth(13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getScreenHeight(20),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ไปยัง',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        appController.accountInfo.value.accountName,
                        style: TextStyle(
                          color: Color(0xff1C1939),
                          fontSize: getScreenWidth(20),
                        ),
                      ),
                      Text(
                        Util.formatAccountNo(appController
                            .accountInfo.value.accountNo
                            .toString()),
                        style: TextStyle(
                          color: Color(0xff1C1939),
                          fontSize: getScreenWidth(13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'เลขที่รายการ',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                  Text(
                    ref,
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount sent',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                  Text(
                    '${NumberFormat.currency().format(double.parse(transferController.amount.text)).replaceAll("USD", "")} บาท',
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getScreenHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ค่าธรรมเนียม',
                    style: TextStyle(
                      color: Color(0xff9EA6BE),
                      fontSize: getScreenWidth(18),
                    ),
                  ),
                  Text(
                    '0.00 บาท',
                    style: TextStyle(
                      color: Color(0xff1C1939),
                      fontSize: getScreenWidth(18),
                    ),
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
