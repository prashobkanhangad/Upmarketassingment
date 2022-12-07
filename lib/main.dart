import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/presentation/loginpage/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upmarket Assignment',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        // primarySwatch: Colors.blue,
        backgroundColor: kgreycolor
      ),
      home: const LoginScreen(),
    );
  }
}
