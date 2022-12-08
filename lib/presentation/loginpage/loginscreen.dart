import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/presentation/homepage/homescreen.dart';
import 'package:upmark_assignment/presentation/loginpage/otpscreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final numbercontroller = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  static String verify = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhitecolor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),
                  TextfieldWidgetMobile(
                    prefixtext: '+91 ',
                    hintText: 'MOBILE NUMBER',
                    controller: numbercontroller,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () async {
                          onsendotppressed(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kblackcolor,
                            foregroundColor: kwhitecolor),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onsendotppressed(context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${numbercontroller.text}',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        verify = verificationId;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              Otpscreen(number: numbercontroller.text, verify: verify),
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

class TextfieldWidgetMobile extends StatelessWidget {
  final String hintText;
  final controller;
  final prefixtext;
  const TextfieldWidgetMobile(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.prefixtext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          prefixText: prefixtext,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 10.0,
          ),
          prefixIcon: const Icon(Icons.phone_android, color: kblackcolor),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kblackcolor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kblackcolor)),
    );
  }
}

class TextfieldWidgetotp extends StatelessWidget {
  final String hintText;
  final controller;

  const TextfieldWidgetotp({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.0,
            horizontal: 10.0,
          ),
          prefixIcon: const Icon(Icons.password, color: kblackcolor),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: kblackcolor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: kblackcolor)),
    );
  }
}
