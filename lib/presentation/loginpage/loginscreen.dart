import 'package:flutter/material.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/presentation/homepage/homescreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                children: [
                  const SizedBox(height: 20),
                  TextfieldWidget(hintText: 'MOBILE NUMBER'),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
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
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Add Account',
                        style: TextStyle(
                          color: kblackcolor,
                          fontSize: 18,
                          letterSpacing: 1,
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  const TextfieldWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
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
          hintText: 'MOBILE NUMBER',
          hintStyle: TextStyle(color: kblackcolor)),
    );
  }
}
