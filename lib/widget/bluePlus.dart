import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BluePlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 400,
        height: 174,
        margin: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Color(0xff1C75FF)),
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Container(
                child: Text(
                  'โอนเงิน',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Thasadith',
                      color: Color(0xffFFFFFF)),
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(bottom: 25),
              ),
              Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xff47AEFC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
                          child: SvgPicture.asset(
                            "assets/icons/people.svg",
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 8),
                      ),
                      Text(
                        "G Bank",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Thasadith',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xff47AEFC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
                          child: SvgPicture.asset(
                            "assets/icons/bank.svg",
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 8),
                      ),
                      Text(
                        "ต่างธนาคาร",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Thasadith',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Container(
                        width: 62,
                        height: 62,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xff47AEFC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
                          child: SvgPicture.asset(
                            "assets/icons/code.svg",
                          ),
                        ),
                        margin: EdgeInsets.only(bottom: 8),
                      ),
                      Text(
                        "QR code",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontFamily: 'Thasadith',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
