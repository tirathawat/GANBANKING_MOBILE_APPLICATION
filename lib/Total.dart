import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Total extends StatelessWidget {
  hexColor(String colorhexcode) {
    String colornew = '0xff' + colorhexcode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        
         Column(
          children: [
             

            _blueContainer(),
            
        
            
          ],
          
        ),
        
      
    );
  }

  Container _blueContainer() {
    return Container(
            color: Color(hexColor('#FFFFFF')),
            
            width: 450,
            height: 683.4,
            child: Center(
              child: Column(
                children: [
                  
                  

                  RichText(
                    
                    text: TextSpan(
                      children: <TextSpan>[
                        
                        TextSpan(
                          
                          text:
                              '\n\n\n\n\n\n       ยอดเงินคงเหลือ',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                        TextSpan(
                            text: '\n   7,425\n',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'Thasadith-Bold',
                              color: Color(hexColor('#000000')),
                            )),
                       
                        TextSpan(
                            text:
                                ' ข้อมูล ณ วันที่ 23 เม.ย 64',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Thasadith-Regular',
                              color: Color(hexColor('#686666')),
                            )),
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height:100,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      width: 350,
                      height: 105,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#F9F9FB')),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8)),
                      ),
                      child: Column(children: [Container( child: Column(children: [Container(
                            padding:EdgeInsets.only(top:5),
                            margin:EdgeInsets.only(right:90),
                            child: Text(
                              'สรุปรายการย้อนหลัง ม.ค. 64 - เม.ย. 64',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Thasadith-Bold',
                                color: Color(hexColor('#1C1939')),
                              ),
                            ),
                          ),
                     
                       Row(
                        
                        children: [
                          SizedBox(
                            width:20,
                          ),
                          Container(
                        
                            margin: EdgeInsets.only(top: 25),
                            
                            
                            height: 10.0,
                            width: 10.0,
                            decoration: new BoxDecoration(
                               color: Color(hexColor('#FF5141')),
                              shape: BoxShape.circle,
                            ),
                          ),
                          
                          _buildText(),
                          SizedBox(
                            width:90,
                          ),
                          Container(
                      
                            margin: EdgeInsets.only(top: 25),
                          
                            height: 10.0,
                            width: 10.0,
                            decoration: new BoxDecoration(
                               color: Color(hexColor('#44EF44')),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                           
                            padding: EdgeInsets.only(top:11),
                            child: Text(
                              'รายรับ',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Thasadith-Regular',
                                color: Color(hexColor('#1C1939')),
                              ),
                            ),
                          ),
                          Container(
                          
                             padding: EdgeInsets.symmetric(horizontal: 15),
                             
                          child:Text(
                            '2,730',
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Thasadith-Regular',
                              color: Color(hexColor('#1C1939')),
                            ),
                          ),
                          ),
                          
                          
                        ],
                      ),
                        ],
                      ),
                      
                      
                      
                      ],
                      ),
                      ),
                ],
              ),
             
            ),
            Column(children: [Container(
              padding: EdgeInsets.only(right:215),
              
               child:RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '\n\nยอดใช้จ่ายรายประเภท',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Thasadith-Bold',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(children: [Column(children: [Container(

                       padding: EdgeInsets.only(left:30),
                       
                       child:  Image(
                         width: 30,
                         height:20,
          image: AssetImage('assets/newfile.png'),
                       ),
                       
      
            ),
            
            
            ],
            
            ),
            SizedBox(
              width: 25,
            ),
              RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'จ่ายบิล\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Thasadith-Bold',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                       TextSpan(
                          text:
                              '4 transactions',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  
           SizedBox(
              width: 170,
            ),
              RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        
                       TextSpan(
                          text:
                              '200',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  
            ],
          
            ),
            Container(
                      child:RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        
                       TextSpan(
                          text:
                              '____________________________',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  

            ),
            SizedBox(
              height: 10,
            ),
            Row(children: [Column(children: [Container(

                       padding: EdgeInsets.only(left:30),
                       
                       child:  Image(
                         width: 30,
                         height:20,
          image: AssetImage('assets/newsend.png'),
                       ),
                       
      
            ),
            
            
            ],
            
            ),
            SizedBox(
              width: 25,
            ),
              RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'จ่ายบิล\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Thasadith-Bold',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                       TextSpan(
                          text:
                              '3 transactions',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  
           SizedBox(
              width: 170,
            ),
              RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        
                       TextSpan(
                          text:
                              '200',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  
            ],
          
            ),
             Container(
                      child:RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        
                       TextSpan(
                          text:
                              '____________________________',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  

            ),
             SizedBox(
              height: 10,
            ),
            Row(children: [Column(children: [Container(

                       padding: EdgeInsets.only(left:30),
                       
                       child:  Image(
                         width: 30,
                         height:20,
          image: AssetImage('assets/newsend.png'),
                       ),
                       
      
            ),
            
            
            ],
            
            ),
            SizedBox(
              width: 25,
            ),
              RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'อื่นๆ\n',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Thasadith-Bold',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                       TextSpan(
                          text:
                              '2 transactions',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  
           SizedBox(
              width: 170,
            ),
              RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        
                       TextSpan(
                          text:
                              '200',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'Thasadith-Regular',
                            color: Color(hexColor('#1C1939')),
                          ),
                        ),
                      ],
                    ),
                  ),  
            ],
          
            ),
            ],
            ),
                ],
              ),
            ),
            
          );
  }

  Column _buildBottomTExt() {
    return Column(
       
      
       children: [
         
         Container(
           
                      alignment: Alignment.center,
                      width: 450,
                      height: 470,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#ECECEF')),
                       
                      ),
         
         child:Column(
         children:[Container(
           
           alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n        ธุรกรรม',
                        
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
          SizedBox(
           height:10,
            ),
        Row(children:[
         
         Column(children: [Container(
          
              margin: EdgeInsets.only(left: 30),        
                      width: 100,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#FFFFFF')),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8)),
                      ),
                       child: Column(children: [
                          Image(
          image: AssetImage('assets/send.png'),
          height: 60,
          width: 40,
                       
                          ),
                            Text(
           
          'โอนเงิน',
          textAlign: TextAlign.center,
          
         ),
                       ],
                       
        ),
        
        
         ),
         
         ],
         ),
         
        Column(children: [Container(
          
              margin: EdgeInsets.only(left: 30),        
                      width: 100,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#FFFFFF')),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8)),
                      ),
                       child: Column(children: [
                          Image(
          image: AssetImage('assets/file.png'),
          height: 60,
          width: 40,
                       
                          ),
                            Text(
           
          'จ่ายเงิน',
          textAlign: TextAlign.center,
          
         ),
                       ],
                       
        ),
        
        
         ),
         
         ],
         ),
           Column(children: [Container(
          
              margin: EdgeInsets.only(left: 30),        
                      width: 100,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#FFFFFF')),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8)),
                      ),
                       child: Column(children: [
                          Image(
          image: AssetImage('assets/up.png'),
          height: 60,
          width: 40,
                       
                          ),
                            Text(
           
          'สรุปรายการ',
          textAlign: TextAlign.center,
          
         ),
                       ],
                       
        ),
        
        
         ),
         
         ],
         ),
        ],
        ),
        Container(
           
           alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n        โปรโมชั่น',
                        
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
         SizedBox(
           height:10,
           
         ),
         
         Container(
          
              margin: EdgeInsets.only(left: 10),
                     
                      width: 360,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#FFFFFF')),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8)),
                      ),
                     child: Padding(
                       padding: EdgeInsets.all(0),
                       child:  Image(
          image: AssetImage('assets/get12.png'),
          
          fit:BoxFit.fill,
                       ),
        ),
         
         ),
         Container(
          
              margin: EdgeInsets.only(left: 10),
                     
                      width: 360,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color(hexColor('#FFFFFF')),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(8)),
                      ),
                     child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n     ไก่ทอดฟรี\n',
                        
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Thasadith-Bold',
                          color: Color(hexColor('#1C1939')),
                        ),
                      ),
                      TextSpan(
                        text: '\n        เพียงแค่จ่ายด้วย G Bank รับไปเลยไก่ทอดสิบสองตัวฟรี!',
                        
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Thasadith-Regular',
                          color: Color(hexColor('#1C1939')),
                        ),
                      ),
                       TextSpan(
                        text: 'Buy now\n\n        ',
                        
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Thasadith-Regular',
                          color: Color(hexColor('#1C1939')),
                         
                        ),
                      ),
                      TextSpan(
                        text: 'Buy now\n',
                        
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Thasadith-Regular',
                          color: Color(hexColor('#195ED2')),
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
        
         
         
         
       ],
         
    
              );
  }

 

  Column _buildText() {
    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.only(top:12),
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
                             
                          child:Text(
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
