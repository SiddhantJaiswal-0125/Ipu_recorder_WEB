import 'package:flutter/material.dart';
import 'package:ipu_record/Helpers/CustomWidgets.dart';
import 'package:ipu_record/Screens/LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWidgets.CustomAppBar("IPU Insight"),
      body: const LoginScreen(),
    );
  }
}
