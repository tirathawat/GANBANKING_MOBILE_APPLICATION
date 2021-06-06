import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQrCodePage extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My QR Code',
          style: TextStyle(
            color: Color(0xffffffff),
            //fontFamily: 'DMSans',
            fontSize: getScreenWidth(20),
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  SafeArea _buildBody() {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            _buildQrBox(),
          ],
        ),
      ),
    );
  }

  Container _buildQrBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(getScreenWidth(13), getScreenHeight(15),
          getScreenWidth(13), getScreenHeight(50)),
      margin: EdgeInsets.symmetric(
        horizontal: getScreenWidth(40),
        vertical: 100,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(),
          _buildDashlineAndQrcode(),
        ],
      ),
    );
  }

  Center _buildDashlineAndQrcode() {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: getScreenHeight(12),
        ),
        SvgPicture.asset(Assets.DASHLINE),
        SizedBox(
          height: getScreenHeight(34),
        ),
        Obx(
          () => QrImage(
            data: appController.qrcode.value,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ),
      ],
    ));
  }

  Padding _buildText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'บัญชี',
            style: TextStyle(
              color: Color(0xff9EA6BE),
              fontSize: getScreenWidth(16),
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: getScreenHeight(10),
          ),
          Obx(
            () => Text(
              appController.accounts.value == null ||
                      appController.accounts.value.length == 0
                  ? ""
                  : appController.accounts
                      .value[appController.selectedAccount.value].accountName,
              style: TextStyle(
                color: Color(0xff1C1939),
                fontSize: getScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: getScreenHeight(10),
          ),
          Obx(
            () => Text(
              appController.accounts.value == null ||
                      appController.accounts.value.length == 0
                  ? ""
                  : Util.formatAccountNo(appController.accounts
                      .value[appController.selectedAccount.value].accountNo
                      .toString()),
              style: TextStyle(
                color: Color(0xff9EA6BE),
                fontSize: getScreenWidth(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
