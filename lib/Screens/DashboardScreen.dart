import 'package:flutter/material.dart';
import 'package:ipu_record/Helpers/CustomWidgets.dart';
import 'package:ipu_record/Model/User.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, required this.currentUser});

  final User currentUser;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.CustomAppBar("IPU Insight"),
      body: Column(children: [


      ],),
    );
  }
}
