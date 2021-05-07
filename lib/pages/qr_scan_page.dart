import 'package:flutter/material.dart';

class QRScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Center(
      child: Container(
        height: 298,
        width: 298,
        color: Color(0xffDEDEDE),
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text("แสกน"),
      backgroundColor: Color(0xff1C75FF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
