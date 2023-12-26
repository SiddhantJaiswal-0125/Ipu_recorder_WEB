import 'package:flutter/material.dart';
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
    return Container(child: Text(""+widget.currentUser.firstName.toString()),);
  }
}
