import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/pages/transfer/receipt_page.dart';
import 'package:ganbanking/widgets/default_button.dart';
import 'package:ganbanking/widgets/selection_item.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SecondTransferingPage extends StatelessWidget {
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  final elements1 = [
    "Breakfast",
    "Lunch",
    "2nd Snack",
    "Dinner",
    "3rd Snack",
  ];
  final RxInt selectedIndex1 = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: DirectSelect(
          itemExtent: 35.0,
          selectedIndex: selectedIndex1.value,
          backgroundColor: Colors.red,
          child: SelectionItem(
            isForList: false,
            title: elements1[selectedIndex1.value],
          ),
          onSelectedItemChanged: (index) {
            selectedIndex1.value = index;
          },
          items: _buildItems1()),
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
                            fontSize: getScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Text(
                            accountAPI.accounts.value == null
                                ? ""
                                : Util.formatAccountNo(accountAPI
                                    .accounts
                                    .value[accountAPI.selectedAccount.value]
                                    .accountNo
                                    .toString()),
                            style: TextStyle(
                              fontSize: getScreenWidth(16),
                            ),
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
                            fontSize: getScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "295,900 บาท",
                          style: TextStyle(
                            fontSize: getScreenWidth(16),
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

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => SelectionItem(
              title: val,
            ))
        .toList();
  }

  _buildContent() {
    return Padding(
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
              Get.to(() => ReceiptPage());
            },
            text: Text(
              'ตรวจสอบความถูกต้อง',
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
    );
  }

  TextFormField _buildAmountForm() {
    return TextFormField(
      style: TextStyle(
        fontSize: getScreenWidth(18),
        color: Colors.black,
      ),
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  TextFormField _buildAccountNoForm() {
    return TextFormField(
      inputFormatters: [
        MaskTextInputFormatter(
            mask: '###-#-####-#', filter: {"#": RegExp(r'[0-9]')})
      ],
      style: TextStyle(
        fontSize: getScreenWidth(18),
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        fillColor: Color(0xFFF7F7F7),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
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
