import 'package:flutter/material.dart';

class Petch_pin extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n\n\n\n\n\n\n\n  ตั้งค่ารหัสผ่าน',
                        style: TextStyle(
                          fontSize: 35,
                          fontFamily: 'Thasadith-Bold',
                          color: Color(hexColor('#1C1939')),
                        )),
                    TextSpan(
                        text: '\n             สำหรับใช้ในการทำธุรกรรม',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Thasadith-Regular',
                          color: Color(hexColor('#1C1939')),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Thasadith-Regular',
                          color: Color(hexColor('#1C1939')),
                        )),
                  ],
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                  onPressed: () => {print('oh fuck')},
                  child: Text('ต่อไป',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Thasadith-Regular',
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Color(hexColor('#1C75FF'))),
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '  \nby clicking start, you agree to our ',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Thasadith-Regular',
                        color: Color(hexColor('#1C1939')),
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy\n',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Thasadith-Regular',
                        color: Color(hexColor('#003DFF')),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: '                     our ',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Thasadith-Regular',
                        color: Color(hexColor('#1C1939')),
                      ),
                    ),
                    TextSpan(
                      text: 'Teams and Conditions',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Thasadith-Regular',
                        color: Color(hexColor('#003DFF')),
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
