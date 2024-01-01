import 'package:flutter/material.dart';

import '../Helpers/CustomWidgets.dart';

class testScreen extends StatefulWidget {
  const testScreen({super.key});

  @override
  State<testScreen> createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.CustomAppBar("IPU Insight"),
      body: Column(
        children: [
          Container(height: 15,),
          CustomWidgets.UserTile("User Name", "Siddhant"),
         
          CustomWidgets.UserTile("Org ID", "afadgfdaf54548fdfas"),

          CustomWidgets.UserTile(
              "Registered Email", "sidjaiswal@informatica.com"),



        ],
      ),
    );
  }
}
