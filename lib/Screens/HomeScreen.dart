import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipu_record/Screens/LoginScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold
      (
        appBar: AppBar (title:   Text('IPU Insight',
      style:  GoogleFonts.comicNeue(fontWeight: FontWeight.bold,color: Colors.white),
      ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
                icon: Image.asset('resources/phoenix.png'),
                onPressed: () => {

                }),
          ]
        ),



     body: LoginScreen(),
    );

  }
}
