import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ipu_record/Helpers/Constants.dart';

class LoginHelper {


  static Future<void> makeLoginCall(String username, String password) async {
    print("USER NAME  : " + username);
    print("Password : " + password);
    var response = await http.post(
      Constants.USW1_AWS_POD1_LoginURL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(
        {
          "type": "login",
          "username": username,
          "password": password,
        },
      ),
    );
    print(response.body);
  }

}
