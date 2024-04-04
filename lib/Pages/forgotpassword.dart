import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/UIHelper.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({super.key});

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
  TextEditingController emailControler = TextEditingController();

  forGotPassword(String email) async {
    if (email == "") {
      return UIHelper.customAlert(context, "Enter an Email To Reset Password");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.CustomTextfield(
              emailControler, "Enter Email ", Icons.email, false),
          SizedBox(
            height: 20,
          ),
          UIHelper.CustomButton(() {
            forGotPassword(emailControler.text.toString());
          }, "Reset Password")
        ],
      ),
    );
  }
}
