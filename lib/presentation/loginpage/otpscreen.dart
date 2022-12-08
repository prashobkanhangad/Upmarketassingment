import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/presentation/homepage/homescreen.dart';

class Otpscreen extends StatelessWidget {
  final number;
  String verify;
  Otpscreen({super.key, required this.number, required this.verify});

  final FirebaseAuth auth = FirebaseAuth.instance;

  final otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text('Verification',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Enter the code sent to the number',
              style: textnormal20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('+91${number}', style: textbold20),
            const SizedBox(
              height: 40,
            ),
            pinputwidget(controller: otpcontroller),
            const SizedBox(
              height: 20,
            ),
            const Text('Dont Recieve Code? Resend', style: textbold18),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verify,
                              smsCode: otpcontroller.text);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    } catch (e) {
                      print('Wrong Otp');
                      Fluttertoast.showToast(msg: 'Wrong Otp',gravity: ToastGravity.CENTER, );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kblackcolor,
                      foregroundColor: kwhitecolor),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

class pinputwidget extends StatelessWidget {
  final controller;
  const pinputwidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      length: 6,
      defaultPinTheme: PinTheme(
          textStyle: const TextStyle(fontSize: 20),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: kashcolor, borderRadius: BorderRadius.circular(6))),
    );
  }
}
