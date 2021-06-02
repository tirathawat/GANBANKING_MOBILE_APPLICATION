import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/pages/auth/6_verifying_number_page.dart';
import 'package:get/get.dart';

class FirebaseService {
  static String _verificationId;
  static Future<void> requestOtp(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+66123456789",
        timeout: const Duration(
          seconds: 60,
        ),
        verificationCompleted: (PhoneAuthCredential credential) {
          print("verificationCompleted");
        },
        verificationFailed: (FirebaseException error) {
          print("error: ${error.message}");
          Get.snackbar(
            "พบข้อผิดพลาด",
            error.message,
          );
        },
        codeSent: (String code, int number) {
          _verificationId = code;
          print("verificationId: $code");

          Get.to(() => VerifyingNumberPage());
        },
        codeAutoRetrievalTimeout: (String timeout) {});
  }

  static Future<bool> signIn(String smsCode) async {
    return await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    ))
        .then((value) {
      if (value == null)
        return false;
      else
        return true;
    });
  }
}
