import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ganbanking/config/size.dart';
import 'package:ganbanking/constants/assets.dart';

class FirstTransferingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      body: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopMenu(),
          _buildFav(),
          _buildContactSearch(),
          _buildContactList(),
        ],
      ),
    );
  }

  _buildTopMenu() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getScreenWidth(60),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Color(0xff1C75FF),
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'โอนเงิน',
              style: TextStyle(
                fontSize: getScreenWidth(20),
                color: Color(0xffFFFFFF),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuButton("G Bank", Assets.PEOPLE),
                _buildMenuButton("ต่างธนาคาร", Assets.BANK),
                _buildMenuButton("QR code", Assets.QRCODE),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildMenuButton(String text, String icon) {
    return Column(
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
    );
  }

  _buildListFav() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => _buildFavButton(
              'assets/images/Rectangle Copy 3.png', 'Hailey', '+090078601'),
        ),
      ),
    );
  }

  _buildFavButton(String image, String name, String phone) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      padding: EdgeInsets.only(bottom: 20),
      height: 164,
      width: 142,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        children: [
          Image.asset(
            image, //MOCK
            height: 100,
            width: 100,
          ),
          Text(
            name,
            style: TextStyle(
              color: Color(0xff1C1939),
              fontSize: getScreenWidth(13),
            ),
          ),
          Text(
            phone,
            style: TextStyle(
              color: Color(0xff9EA6BE),
              fontFamily: 'DMSans',
              fontSize: getScreenWidth(12),
            ),
          ),
        ],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              "รายชื่อผู้ติดต่อล่าสุด",
              style: TextStyle(
                color: Color(0xff1C1939),
                fontSize: getScreenWidth(18),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(
              style: TextStyle(
                fontSize: getScreenWidth(14),
                color: Colors.black,
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Color(0xffF9F9FB),
                filled: true,
                hintText: "ค้นหา...",
                hintStyle: TextStyle(
                  fontSize: getScreenWidth(14),
                  color: Color(0xff9EA6BE),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    Assets.SEARCH,
                  ),
                ),
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
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: List.generate(
            10,
            (index) => Column(
              children: [
                _buildContactItem("Zayn Michel", '+090078601'),
                Divider(
                  height: 0.25,
                  color: Color(0xffD2D1D7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildContactItem(String name, String phone) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: getScreenWidth(16),
            color: Color(0xff1C1939),
          ),
        ),
        subtitle: Text(
          phone,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getScreenWidth(12),
            color: Color(0xff9EA6BE),
          ),
        ),
        trailing: Container(
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
                  fontSize: getScreenWidth(12),
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
