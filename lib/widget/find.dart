import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ganbanking/widget/List.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "รายชื่อผู้ติดต่อล่าสุด",
              style: TextStyle(
                color: Color(0xff1C1939),
                fontSize: 18,
                fontFamily: 'Thasadith',
              ),
            ),
            FindFormField(),
          ],
        ),
        margin: EdgeInsets.only(left: 27,right: 25),
      ),
    );
  }

  Widget FindFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Thasadith',
          color: Colors.black,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            fillColor: Color(0xffF9F9FB),
            labelText: "ค้นหา",
            labelStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'Thasadith',
              color: Color(0xff9EA6BE),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon: Icon(Icons.loupe)),
      ),
    );
  }
}
