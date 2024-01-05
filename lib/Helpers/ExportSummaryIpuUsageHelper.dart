import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/JobResponse.dart';
import '../Model/User.dart';
import 'Constants.dart';

class ExportSummaryIpuUsageHelper
{
    static void  triggerExportJob(User currentSession, String startDate, String endDate) async{


    startDate =  startDate+"T00:00:00Z";
    endDate = endDate +"T00:00:00Z";

    print("Session id "+currentSession.icSessionId.toString());


    print(currentSession.name);
    print(startDate);
    print(endDate);


    String url = currentSession.serverUrl.toString()+"/"+Constants.Export_AllLinkedOrgReport.toString();

    String sessionID = "\""+currentSession.icSessionId.toString()+"\"";
      print(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "INFA-SESSION-ID":"${currentSession.icSessionId}",
      },
      body: jsonEncode(
        {
          "startDate": "${startDate}",
          "endDate": "${endDate}",
          "callbackUrl": "https://MyExportJobStatus.com",
        },
      ),
    );
    print(response.body);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    JobResponse job = JobResponse.fromJson(jsonMap);


    print("JOB IS "+job.jobId);
    // Map<String, dynamic> jsonMap = json.decode(response.body);

  }
}