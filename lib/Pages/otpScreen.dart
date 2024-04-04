import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/UIHelper.dart';
import 'package:flutter_app/Pages/home.dart';

class otpScreen extends StatefulWidget {
  String verificationId;
  otpScreen({super.key, required this.verificationId});

  @override
  State<otpScreen> createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> {
  TextEditingController otpControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpControler,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          UIHelper.CustomButton(() async {
            try {
              PhoneAuthCredential credential =
                  await PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpControler.text.toString());
              FirebaseAuth.instance.signInWithCredential(credential).then(
                  (value) => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homePage())));
            } catch (ex) {
              log(ex.toString() as num);
            }
          }, "Verify OTP"),
        ],
      ),
    );
  }
}
