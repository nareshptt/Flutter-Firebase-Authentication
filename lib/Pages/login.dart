import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/UIHelper.dart';
import 'package:flutter_app/Pages/forgotpassword.dart';
import 'package:flutter_app/Pages/home.dart';
import 'package:flutter_app/Pages/signup.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  logIn(String email, String password) async {
    if (email == "" && password == "") {
      UIHelper.customAlert(context, "Enter Required Fields");
    } else {
      UserCredential? userCredential;

      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homePage()));
        });
      } on FirebaseAuthException catch (ex) {
        return AlertDialog(
          title: Text(ex.code.toString()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
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
            logIn(emailControler.text.toString(),
                passwordControler.text.toString());
          }, "Login"),
          SizedBox(
            height: 40,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForGotPassword()));
              },
              child: Text("Forgot Password")),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => signupPage()));
              },
              child: Text("Sigup here"))
        ],
      ),
    );
  }
}
