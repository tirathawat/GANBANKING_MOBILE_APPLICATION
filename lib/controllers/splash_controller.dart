import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/apis/account_api.dart';
import 'package:ganbanking/apis/customer_api.dart';
import 'package:ganbanking/pages/auth/2_sign_in_page_1.dart';
import 'package:ganbanking/pages/fill_password_page.dart';
import 'package:ganbanking/pages/home/home_page.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    if (FirebaseAuth.instance.currentUser == null) {
      await Future.delayed(const Duration(seconds: 2), () {});
      Get.off(() => SignInPage1());
    } else {
      //TODO ทำให้มันเร็วขึ้น
      await CustomerAPI.hasCustomerKey(FirebaseAuth
              .instance.currentUser.phoneNumber
              .replaceAll("+66", "0"))
          .then((value) {
        if (value) {
          Get.off(() => HomePage());
        } else {
          Get.to(() => FillPasswordPage());
        }
      });

      // final AccountAPI accountAPI = Get.put(AccountAPI());
      // await accountAPI.getAccountList().then((value) async {
      //   accountAPI.getTransaction();
      //   Get.off(() => HomePage());
      // });
    }

    super.onInit();
  }
}
