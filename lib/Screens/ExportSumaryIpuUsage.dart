import 'package:flutter/material.dart';

class ExportSummaryIPUUsage extends StatefulWidget {
  const ExportSummaryIPUUsage({super.key});

  @override
  State<ExportSummaryIPUUsage> createState() => _ExportSummaryIPUUsageState();
}

class _ExportSummaryIPUUsageState extends State<ExportSummaryIPUUsage> {
  String startDate = "";
  String endDate = "";
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: startDateController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: "YYYY-MM-DD",
            labelText: "Enter the Start Date",
            // helperText: "Password must contain special character",

            alignLabelWithHint: false,
            filled: true,
          ),
          textInputAction: TextInputAction.done,
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: endDateController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: "YYYY-MM-DD",
            labelText: "Enter the End Date",
            alignLabelWithHint: false,
            filled: true,
          ),
          textInputAction: TextInputAction.done,
        ),
        SizedBox(
          height: 15,
        ),
        Center(
            child: TextButton(
              onPressed: () {


              },
              child: Text("Submit"),
            ))
      ],
    );
  }
}
