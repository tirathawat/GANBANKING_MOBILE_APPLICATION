import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/config/util.dart';
import 'package:ganbanking/constants/assets.dart';
import 'package:ganbanking/controllers/app_controller.dart';
import 'package:ganbanking/controllers/transfer_controller.dart';
import 'package:ganbanking/pages/transfer/qr_scan_page.dart';
import 'package:ganbanking/pages/transfer/second_transfering_page.dart';
import 'package:ganbanking/pages/transfer/selection_bank_page.dart';
import 'package:ganbanking/services/qr_scan_service.dart';
import 'package:ganbanking/widgets/custom_progress_indicator.dart';
import 'package:get/get.dart';

class FirstTransferingPage extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  final AccountAPI accountAPI = Get.find<AccountAPI>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF9F9FB),
      body: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFav(),
          _buildContactSearch(),
          _buildContactList(),
        ],
      ),
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
        preferredSize: Size.fromHeight(120),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            getScreenWidth(60),
            0,
            getScreenWidth(60),
            20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMenuButton(
                "G Bank",
                Assets.PEOPLE,
                page: () => SecondTransferingPage(),
              ),
              _buildMenuButton(
                "ต่างธนาคาร",
                Assets.BANK,
                page: () => SelectionBankPage(gotoTransfer: true),
              ),
              _buildMenuButton(
                "Scan QR",
                Assets.QRCODE,
                page: () => QRScanPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildMenuButton(String text, String icon, {Function page}) {
    return InkWell(
      onTap: () async {
        if (page != null)
          Get.to(page);
        else {
          await QrScanService.scan().then((value) async {
            if (value == null) {
              Get.snackbar("แจ้งเตือน", "เกิดข้อผิดพลาด");
            } else {
              Get.dialog(
                CustomProgressIndicator(),
                barrierDismissible: false,
              );
              await accountAPI.getInfoByQrcode(value).then((value) {
                Get.back();
                if (value) {
                  Get.to(SecondTransferingPage());
                } else {
                  Get.snackbar("แจ้งเตือน", "Qrcode ไม่ถูกต้อง");
                }
              });
            }
          });
        }
      },
      child: Column(
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
                icon,
                color: Colors.white,
              ),
            ),
            margin: EdgeInsets.only(bottom: 8),
          ),
          Text(
            text,
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: getScreenWidth(12),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _buildListFav() {
    var list = appController.preferences
        .getKeys()
        .toList()
        .where((element) =>
            element.split('_')[0] == 'fav' &&
            appController.preferences.getBool(element))
        .toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: list.length == 0
          ? Container(
              height: 164,
              width: Get.width,
              alignment: Alignment.center,
              child: Text("ท่านยังไม่มีรายการโปรด"),
            )
          : Row(
              children: List.generate(
                list.length,
                (index) {
                  var data = list[index].split("_");
                  return _buildFavButton(
                      data[4], data[2], Util.formatAccountNo(data[1]), data[3]);
                },
              ),
            ),
    );
  }

  _buildFavButton(
      String banklogo, String name, String accountNo, String bankid) {
    return InkWell(
      onTap: () {
        appController.selectedBank.value = appController.bank.value.indexOf(
            appController.bank.value
                .firstWhere((element) => element.bankId.toString() == bankid));
        TransferController transferController = Get.put(TransferController());
        transferController.accountNoTo.text = Util.formatAccountNo(accountNo);

        Get.to(SecondTransferingPage());
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
          right: 10,
          bottom: 10,
        ),
        height: 164,
        width: 142,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                banklogo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getScreenWidth(30),
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                color: Color(0xff1C1939),
                fontSize: getScreenWidth(16),
              ),
            ),
            Text(
              accountNo,
              style: TextStyle(
                color: Color(0xff9EA6BE),
                fontFamily: 'DMSans',
                fontSize: getScreenWidth(14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFav() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 23,
            bottom: 24,
          ),
          child: Text(
            "รายการโปรด",
            style: TextStyle(
              color: Color(0xff1C1939),
              fontSize: getScreenWidth(18),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        _buildListFav(),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }

  _buildContactSearch() {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(23),
        ),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              "รายชื่อผู้โอนล่าสุด",
              style: TextStyle(
                color: Color(0xff1C1939),
                fontSize: getScreenWidth(18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  _buildContactList() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Obx(
          () => ListView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            children: List.generate(
              appController.lastedTransactions.value == null
                  ? 0
                  : appController.lastedTransactions.value.length,
              (index) {
                var data = appController.lastedTransactions.value[index];
                return Column(
                  children: [
                    _buildContactItem(
                        data.accountName,
                        Util.formatAccountNo(data.accountNo.toString()),
                        data.bankId.toString(),
                        data.accountNo.toString()),
                    Divider(
                      height: 0.25,
                      color: Color(0xffD2D1D7),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _buildContactItem(
      String name, String phone, String bankid, String accountNo) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: getScreenWidth(18),
            color: Color(0xff1C1939),
          ),
        ),
        subtitle: Text(
          phone,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getScreenWidth(14),
            color: Color(0xff9EA6BE),
          ),
        ),
        trailing: InkWell(
          onTap: () {
            appController.selectedBank.value = appController.bank.value.indexOf(
                appController.bank.value.firstWhere(
                    (element) => element.bankId.toString() == bankid));
            TransferController transferController =
                Get.put(TransferController());
            transferController.accountNoTo.text =
                Util.formatAccountNo(accountNo);

            Get.to(SecondTransferingPage());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 27),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff9EA6BE),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 10,
                ),
                child: Text(
                  'โอน',
                  style: TextStyle(
                    fontSize: getScreenWidth(14),
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
