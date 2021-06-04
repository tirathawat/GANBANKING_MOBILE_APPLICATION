import 'package:flutter/material.dart';
import 'package:ganbanking/config/size.dart';
import 'package:get/get.dart';

class FavButton extends StatelessWidget {
  final RxBool _isFav = false.obs;
  @override
  Widget build(BuildContext context) {
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
}
