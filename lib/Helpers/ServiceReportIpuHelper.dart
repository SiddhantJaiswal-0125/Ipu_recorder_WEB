import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:html' as html;

import '../Model/JobResponse.dart';

import '../Model/User.dart';
import 'Constants.dart';

class ServiceRepportIpuHelper {
  static void invokeJob(User currentSession) async {
    print("I came back here");
  }

  static Future<JobResponse> triggerExportJob(
      User currentSession, String startDate, String endDate) async {
    startDate = "${startDate}T00:00:00Z";
    endDate = "${endDate}T00:00:00Z";

    print("Session id ${currentSession.icSessionId}");

    print(currentSession.name);
    print(startDate);
    print(endDate);

    String url =
        "${currentSession.serverUrl}/${Constants.Trigger_ServiceReport}";

    print(url);
    var response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "INFA-SESSION-ID": "${currentSession.icSessionId}",
      },
      body: jsonEncode(
        {
          "startDate": startDate,
          "endDate": endDate,
          "allMeters": "FALSE",
          "meterId": Constants.MeterID_DI,
          "callbackUrl": "https://MyExportJobStatus.com",
        },
      ),
    );
    print(response.body);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    JobResponse job = JobResponse.fromJson(jsonMap);

    // Map<String, dynamic> jsonMap = json.decode(response.body);

    return job;
  }

  static Future<JobResponse> checkJobStatus(
      User currentSession, JobResponse jobResponse) async {
    JobResponse currentStatus = await checkStatus(currentSession, jobResponse);

    if (currentStatus.status.toString() != "SUCCESS") {
      print("RERUN inside if statement ");
      Future.delayed(const Duration(seconds: 5), () async {
        jobResponse = await checkJobStatus(currentSession, jobResponse);
      });
    } else {
      print("Final Status ${currentStatus.status}");
      saveApiResponseAsZipWeb(currentSession, jobResponse);
    }
    return jobResponse;
  }

  static Future<JobResponse> checkStatus(
      User currentSession, JobResponse jobResponse) async {
    String url =
        "${currentSession.serverUrl}/${Constants.Check_Job_Status}${jobResponse.jobId}";
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "INFA-SESSION-ID": "${currentSession.icSessionId}",
      },
    );
    print(response.body);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    JobResponse job = JobResponse.fromJson(jsonMap);

    print("JOB IS ${job.status}");

    return job;
  }

  static Future<void> saveApiResponseAsZipWeb(
      User currentSession, JobResponse jobResponse) async {
    print("Inside SaveAPIResponseAsZip  WEB");
    print(jobResponse);
    String apiUrl =
        "${currentSession.serverUrl}/${Constants.Check_Job_Status}${jobResponse.jobId}/download";

    print("Download url : $apiUrl");

    // Replace with your headers
    Map<String, String> headers = {
      'INFA-SESSION-ID': '${currentSession.icSessionId}',
      'Content-Type': 'application/json',
      // Add any other headers as needed
    };

    final http.Response response =
        await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      // Convert the response body to bytes

      print("RESPONSE CODE OK ---- 200 ");
      List<int> bytes = response.bodyBytes;

      // Create an Archive from the bytes
      ZipDecoder().decodeBytes(bytes);

      // Save the zip file
      final html.Blob blob =
          html.Blob([Uint8List.fromList(bytes)], 'application/zip');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'web-save-zip'
        ..download = 'example.zip';
      html.document.body!.children.add(anchor);
      anchor.click();
      html.Url.revokeObjectUrl(url);
      html.document.body!.children.remove(anchor);
      print("FILE SAVED ");
    } else {
      // Handle error
      print(
          'Failed to download the zip file. Status code: ${response.statusCode}');
    }
  }
}
