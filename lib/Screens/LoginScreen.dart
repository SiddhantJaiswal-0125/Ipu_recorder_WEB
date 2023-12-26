import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipu_record/Helpers/LoginHelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  String userName = "";
  String password = "";
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            //<-- Expanded widget
            child: Image.asset(
          'resources/logo.png',
          fit: BoxFit.cover,
        )),
        Expanded(
          //<-- Expanded widget
          child: Container(
            constraints: const BoxConstraints(maxWidth: 21),
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome back',
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to your account',
                  style: GoogleFonts.inter(
                    fontSize: 23,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 35),
                TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter your User Name",
                    labelText: "Username",
                    // helperText: "Password must contain special character",

                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: passwordVisible,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    // helperText: "Password must contain special character",
                    helperStyle: TextStyle(color: Colors.green),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 25),
                Row(
                    //...
                    ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: TextButton(
                    onPressed: () async {
                      userName = userNameController.text;
                      password = passwordController.text;


                   await   LoginHelper.makeLoginCall(userName, password);
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.albertSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),

                    //...
                  ),
                ),
                const SizedBox(height: 15),
          
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
