import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/pages/receipt_page.dart';
import 'package:ganbanking/widgets/default_button.dart';
import 'package:get/get.dart';

class SecondTransferingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildContent(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text("โอนเงิน"),
      backgroundColor: Color(0xff1C75FF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(35),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'จาก',
                style: TextStyle(
                  fontSize: getScreenWidth(20),
                  color: Color(0xffFFFFFF),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 24,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                          "บัญชีออมทรัพย์",
                          style: TextStyle(
                            fontSize: getScreenWidth(13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ยอดเงิน",
                          style: TextStyle(
                            fontSize: getScreenWidth(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "295,900 บาท",
                          style: TextStyle(
                            fontSize: getScreenWidth(13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildContent() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              'ไปยัง',
              style: TextStyle(
                fontSize: getScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildBankSelector(),
            SizedBox(
              height: 20,
            ),
            Text(
              'เลขที่บัญชี',
              style: TextStyle(
                fontSize: getScreenWidth(16),
                color: Color(0xff000000),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildAccountNoForm(),
            SizedBox(
              height: 10,
            ),
            Text(
              'จำนวน',
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: getScreenWidth(16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildAmountForm(),
            Spacer(),
            Defaultbutton(
              onPress: () {
                Get.to(ReceiptPage());
              },
              text: Text(
                'โอนเงิน',
                style: TextStyle(
                  fontSize: getScreenWidth(20),
                  color: Color(0xffFFFFFF),
                ),
              ),
              color: Color(0xff1C75FF),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildAmountForm() {
    return TextFormField(
      style: TextStyle(
        fontSize: getScreenWidth(14),
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: Color(0xFF47AEFC).withOpacity(.2),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFF003DFF),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xFF003DFF),
          ),
        ),
      ),
    );
  }

  TextFormField _buildAccountNoForm() {
    return TextFormField(
      style: TextStyle(
        fontSize: getScreenWidth(14),
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Container _buildBankSelector() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF1B72F9).withOpacity(.26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "G",
            style: TextStyle(
              fontSize: getScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Color(0xFF003DFF),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "G BANK",
            style: TextStyle(
              fontSize: getScreenWidth(15),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
