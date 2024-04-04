import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/UIHelper.dart';
import 'package:flutter_app/Pages/otpScreen.dart';

class phoneauth extends StatefulWidget {
  const phoneauth({super.key});

  @override
  State<phoneauth> createState() => _phoneauthState();
}

class _phoneauthState extends State<phoneauth> {
  TextEditingController phoneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Auth"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.CustomTextfield(
              phoneControler, "Phone number", Icons.phone, false),
          SizedBox(
            height: 30,
          ),
          UIHelper.CustomButton(() async {
            await FirebaseAuth.instance.verifyPhoneNumber(
                verificationCompleted: (PhoneAuthCredential credential) {},
                verificationFailed: (FirebaseAuthException ex) {},
                codeSent: (String verificationid, int? resendtoken) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              otpScreen(verificationId: verificationid)));
                },
                codeAutoRetrievalTimeout: (String verificationId) {},
                phoneNumber: phoneControler.text.toString());
          }, "Verify Phone Number"),
        ],
      ),
    );
  }
}
