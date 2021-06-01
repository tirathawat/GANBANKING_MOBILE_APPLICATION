import 'dart:convert';

import 'package:ganbanking/constants/api.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class CustomerAPI extends GetxController {
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
        if (value.body.contains("true"))
          return true;
        else
          return false;
      },
    );
  }

  static Future<bool> hasCustomerKey(String phone) async {
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
    );
  }

  static Future<bool> createCustomerKey(String phone, String pwd) async {
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
      return value.statusCode == 200;
    });
  }
}
