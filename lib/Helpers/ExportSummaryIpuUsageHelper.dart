import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Constants.dart';

class ExportSummaryIpuUsageHelper
{
  void triggerExportJob() async{

    var response = await http.post(
      Constants.USW1_AWS_POD1_LoginURL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      body: jsonEncode(
        {
          "type": "login",
          "username": "repro_user",
          "password": "ajkdnfedf",
        },
      ),
    );
    print(response.body);
    Map<String, dynamic> jsonMap = json.decode(response.body);

  }
}