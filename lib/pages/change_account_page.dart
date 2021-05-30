import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ganbanking/config/size.dart';

class ChangeAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      appBar: _buildAppBar(),
      body:
          ListView(children: List.generate(6, (index) => _buildAccountItem())),
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

  _buildAccountItem() {
    return Container(
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
            "XXX-X-X888-X",
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
            "295,900 บาท",
            style: TextStyle(
              fontSize: getScreenWidth(16),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
