import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ganbanking/widget/bluePlus2.dart';

class TransferingScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(child: BluePlus2()),
            Container(
              child: Text(
                'ไปยัง',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Thasadith',
                  color: Color(0xff000000),
                ),
              ),
              margin: EdgeInsets.fromLTRB(39, 27, 0, 0),
            ),
            Container(
              child: FindBankfield(),
              margin: EdgeInsets.fromLTRB(37, 18, 37, 0),
            ),
            Container(
              child: Text(
                'เลขที่บัญชี',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Thasadith',
                  color: Color(0xff000000),
                ),
              ),
              margin: EdgeInsets.only(left: 41, top: 12),
            ),
            Container(
              child: FindNumBankfield(),
              margin: EdgeInsets.fromLTRB(37, 6, 37, 0),
            ),
            Container(
              child: Text(
                'จำนวน',
                style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: 'Thasadith',
                    fontSize: 16),
              ),
              margin: EdgeInsets.only(left: 39, top: 9),
            ),
            Container(
              child: FindNumfield(),
              margin: EdgeInsets.fromLTRB(37,8,37, 0),
            ),
            SizedBox(height: 90,),
            Container(
              width: 340,
              height: 60,
              child: Container(
                child: Text(
                  'โอนเงิน',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Thasadith',
                    color: Color(0xffFFFFFF),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(120, 17.5, 120, 16.5),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff1C75FF),
              ),
              margin: EdgeInsets.only(left: 37, right: 37),
            ),
          ],
        ),
      ),
    );
  }

  Widget FindBankfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Thasadith',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Color(0x561B74F9),
          filled: true,
          labelText: "G Bank",
          labelStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'Thasadith',
            color: Color(0xff2C2948),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffffffff), width: 2.5),
          ),
          prefixIcon: Image.asset("assets/images/fullicon.jpg",width: 10,height: 10,),
        ),
      ),
    );
  }

  Widget FindNumBankfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Thasadith',
          color: Colors.black,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: Color(0xffF7F7F7),
          filled: true,
        ),
      ),
    );
  }

  Widget FindNumfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Thasadith',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Color(0x561B74F9),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffffffff), width: 2.5),
          ),
        ),
      ),
    );
  }
}
