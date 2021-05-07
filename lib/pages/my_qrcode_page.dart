import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';

class MyQrCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C75FF),
      body: _buildBody(),
    );
  }

  SafeArea _buildBody() {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: getScreenHeight(50),
            ),
            Text(
              'My QR Code',
              style: TextStyle(
                color: Color(0xffffffff),
                //fontFamily: 'DMSans',
                fontSize: getScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getScreenHeight(67),
            ),
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
        SvgPicture.asset(Assets.QRCODE),
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
              fontSize: getScreenWidth(12),
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: getScreenHeight(10),
          ),
          Text(
            'นายแกน มงคลากร',
            style: TextStyle(
              color: Color(0xff1C1939),
              fontSize: getScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getScreenHeight(10),
          ),
          Text(
            'XXX-X-X888-X',
            style: TextStyle(
              color: Color(0xff9EA6BE),
              fontSize: getScreenWidth(13),
            ),
          ),
        ],
      ),
    );
  }
}
