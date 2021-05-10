import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Account extends StatelessWidget {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: [
            _whiteContainer(),
            _buildBottomTExt(),
          ],
        ),
      ),
    );
  }

  Row _whiteContainer() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              color: Color(hexColor('#FFFFFF')),
              alignment: Alignment.topLeft,
              width: 411,
              height: 100,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'บัญชี',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Thasadith-Bold',
                              color: Color(hexColor('#1C1939')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildBottomTExt() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: 450,
          height: 590,
          decoration: BoxDecoration(
            color: Color(hexColor('#ECECEF')),
          ),
          child: Column(
            children: [
              Container(),
              Container(
                alignment: Alignment.topLeft,
              ),
              SizedBox(
                height: 20,
              ),
              
              _buildwhitebox(),
              SizedBox(height: 15),
            _buildwhitebox(),
            SizedBox(height: 15,),
            _buildwhitebox(),
            
            
              
              
             
            ],
          ),
        ),
      
      ],
    );
  }

  Container _buildwhitebox() {
    return Container(
              margin: EdgeInsets.only(left: 10),
              width: 360,
              height: 150,
              decoration: BoxDecoration(
                color: Color(hexColor('#FFFFFF')),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(8)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'บัญชีออมทรัพย์\n',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Thasadith-Bold',
                                  color: Color(hexColor('#1C1939')),
                                ),
                              ),
                              TextSpan(
                                text: 'XXX-X-X888-X\n',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Thasadith-Regular',
                                  color: Color(hexColor('#1C1939')),
                                ),
                              ),
                              TextSpan(
                                text:
                                    '______________________________________________________',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Thasadith-Regular',
                                  color: Color(hexColor('#1C1939')),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 2),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 35),
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '...',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Thasadith-Bold',
                                    color: Color(hexColor('#8984B7')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17),
                  Container(
                    margin: EdgeInsets.only(right: 220),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'ยอดเงิน\n',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Thasadith-Regular',
                              color: Color(hexColor('#1C1939')),
                            ),
                          ),
                          TextSpan(
                            text: '295,900 บาท',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Thasadith-Bold',
                              color: Color(hexColor('#1C1939')),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
  }

  Column _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'รายจ่าย',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Thasadith-Regular',
              color: Color(hexColor('#1C1939')),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            '1,460',
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'Thasadith-Regular',
              color: Color(hexColor('#1C1939')),
            ),
          ),
        ),
      ],
    );
  }
}
