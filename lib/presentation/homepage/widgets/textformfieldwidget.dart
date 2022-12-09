import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upmark_assignment/core/constants.dart';

class textformfieldwidget extends StatelessWidget {
  final String hinttext;
  final controller;
  final TextInputType keyboardtype;

  const textformfieldwidget({Key? key, required this.hinttext, required this.controller, this.keyboardtype = TextInputType.text,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        keyboardType: keyboardtype,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 13.0,
              horizontal: 8.0,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: kblackcolor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            hintText: hinttext,
            hintStyle: TextStyle(color: kblackcolor)),
      ),
    );
  }
}
