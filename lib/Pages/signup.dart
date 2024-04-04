import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/UIHelper.dart';
import 'package:flutter_app/Pages/home.dart';
import 'package:flutter_app/Pages/login.dart';
import 'package:flutter_app/Pages/phoneauth.dart';

class signupPage extends StatefulWidget {
  const signupPage({super.key});

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  signUP(String email, String password) async {
    if (email == "" && password == "") {
      UIHelper.customAlert(context, "Enter Required Fields");
    } else {
      UserCredential? userCredential;

      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => phoneauth()));
        });
      } on FirebaseAuthException catch (ex) {
        return UIHelper.customAlert(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Signup Page",
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.CustomTextfield(emailControler, "Email", Icons.email, false),
          UIHelper.CustomTextfield(
              passwordControler, "Password", Icons.password, true),
          SizedBox(
            height: 20,
          ),
          UIHelper.CustomButton(() {
            signUP(emailControler.text.toString(),
                passwordControler.text.toString());
          }, "Signup"),
          SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginPage()));
              },
              child: Text("Login here"))
        ],
      ),
    );
  }
}
