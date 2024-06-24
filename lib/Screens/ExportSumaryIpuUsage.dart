import 'package:flutter/material.dart';
import 'package:ipu_record/Helpers/ExportSummaryIpuUsageHelper.dart';
import 'package:ipu_record/Model/JobResponse.dart';

import '../Model/User.dart';

class ExportSummaryIPUUsage extends StatefulWidget {
  final User currentSessiion;
  const ExportSummaryIPUUsage({super.key, required this.currentSessiion});

  @override
  State<ExportSummaryIPUUsage> createState() => _ExportSummaryIPUUsageState();
}

class _ExportSummaryIPUUsageState extends State<ExportSummaryIPUUsage> {
  String startDate = "";
  String endDate = "";
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  late JobResponse jobResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: startDateController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: "YYYY-MM-DD",
            labelText: "Enter the Start Date",
            // helperText: "Password must contain special character",

            alignLabelWithHint: false,
            filled: true,
          ),
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: endDateController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: "YYYY-MM-DD",
            labelText: "Enter the End Date",
            alignLabelWithHint: false,
            filled: true,
          ),
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
            child: TextButton(
          onPressed: () async {
            startDate = startDateController.text;
            endDate = endDateController.text;

            jobResponse = await ExportSummaryIpuUsageHelper.triggerExportJob(
                widget.currentSessiion, startDate, endDate);

            ExportSummaryIpuUsageHelper.checkJobStatus(
                widget.currentSessiion, jobResponse);
          },
          child: const Text("Submit"),
        ))
      ],
    );
  }
}
