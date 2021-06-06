import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ganbanking/constants/api.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class CustomerAPI extends GetxController {
  static bool hasPasscode = false;
  static Future<bool> hasCustomerSession() async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/customer/hassession"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "customer_phone_number": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0"),
          "token": FirebaseAuth.instance.currentUser.uid,
        },
      ),
    )
        .then((value) {
      if (value.body.contains("true"))
        return true;
      else
        return false;
    });
  }

  static Future<void> signOut() async {
    return await http.post(
      Uri.parse("${API.BASE_URL}/mobile/customer/signout"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "customer_phone_number": FirebaseAuth.instance.currentUser.phoneNumber
              .replaceAll("+66", "0")
        },
      ),
    );
  }

  static Future<bool> hasCustomer(String phone) async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/customer/has"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {"customer_phone_number": phone},
      ),
    )
        .then(
      (value) {
        if (value.body == 'dont have passcode')
          hasPasscode = false;
        else
          hasPasscode = true;

        if (value.statusCode == 200) {
          return value.body != 'dont have customer';
        } else {
          return false;
        }
      },
    ).onError((_, stackTrace) {
      return false;
    });
  }

  static Future<String> createCustomerSession(
      String phoneNumber, String password) async {
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/customer/createsession"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "phoneNumber": phoneNumber,
          "token": FirebaseAuth.instance.currentUser.uid,
          "passcode": password,
        },
      ),
    )
        .then((value) {
      if (value.statusCode == 200)
        return utf8.decode(value.bodyBytes);
      else
        return null;
    }).onError((error, stackTrace) => null);
  }

  static Future<bool> hasCustomerKey(String phone) async {
    print(phone);
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/customer/haskey"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {"customer_phone_number": phone},
      ),
    )
        .then(
      (value) {
        if (value.body.contains("true"))
          return true;
        else
          return false;
      },
    ).onError((error, stackTrace) {
      print(error);
      return false;
    });
  }

  static Future<bool> createCustomerKey(String phone, String pwd) async {
    print("token = " + FirebaseAuth.instance.currentUser.uid);
    return await http
        .post(
      Uri.parse("${API.BASE_URL}/mobile/customer/createkey"),
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
        {
          "customer_phone_number": phone,
          "customer_key": pwd,
        },
      ),
    )
        .then((value) {
      print(value.body);
      return value.statusCode == 200;
    });
  }
}
