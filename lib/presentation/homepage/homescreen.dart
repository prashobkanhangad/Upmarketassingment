// import 'dart:developer';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/domain/controller/getxcontroller.dart';
import 'package:upmark_assignment/domain/model/model.dart';
import 'package:upmark_assignment/presentation/homepage/widgets/peopleslistviewwidget.dart';
import 'package:upmark_assignment/presentation/homepage/widgets/textformfieldwidget.dart';
import 'package:upmark_assignment/presentation/loginpage/loginscreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final getcontroller = Get.put(peoplegetxController());

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController adresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('peoples')
            .orderBy('sortid', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.offAll(() => LoginScreen());
                      },
                      child: Text(
                        'Signout',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kwhitecolor),
                      )),
                )
              ],
              backgroundColor: kblackcolor,
            ),
            body: SafeArea(
              child: ListView(
                // shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () => showbottomsheetmethod(context),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 60,
                      child: Center(
                          child: Container(
                        height: 30,
                        width: 160,
                        decoration: BoxDecoration(
                            color: kblackcolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              'Add Peoples',
                              style: textbold20white,
                            ),
                            Icon(
                              Icons.add,
                              color: kwhitecolor,
                            )
                          ],
                        ),
                      )),
                    ),
                  ),
                  PeopleslistviewWidget(
                    snapshot: snapshot,
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> showbottomsheetmethod(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Add Details Of User',
                      style: textbold20,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<peoplegetxController>(builder: (getdata) {
                            return Container(
                              width: screenwidth * 0.4,
                              height: screenwidth * 0.4,
                              child: Column(
                                children: [
                                  Container(
                                      width: screenwidth * 0.4,
                                      height: screenwidth * 0.33,
                                      decoration: BoxDecoration(
                                          color: kgreycolor,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: getdata.imageurl == null
                                                ? AssetImage(
                                                        'asset/136-1366211_group-of-10-guys-login-user-icon-png.png')
                                                    as ImageProvider
                                                : FileImage(
                                                    File(
                                                      getdata.imageurl!.path
                                                          .toString(),
                                                    ),
                                                  ),
                                          ),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5)))),
                                  GestureDetector(
                                    onTap: () => getdata.userImagePicker(),
                                    child: Container(
                                      width: screenwidth * 0.4,
                                      height: screenwidth * 0.07,
                                      decoration: const BoxDecoration(
                                          color: kblackcolor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Text(
                                            'Upload Image',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: kwhitecolor),
                                          ),
                                          Icon(
                                            Icons.camera_alt,
                                            color: kwhitecolor,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: screenwidth * 0.6 - 30,
                            height: screenwidth * 0.4,
                            // color: kgreycolor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textformfieldwidget(
                                  
                                  hinttext: 'Name',
                                  controller: namecontroller,
                                ),
                                textformfieldwidget(
                                  keyboardtype: TextInputType.number,
                                  hinttext: 'Age',
                                  controller: agecontroller,
                                ),
                                textformfieldwidget(
                                  
                                  hinttext: 'Adress',
                                  controller: adresscontroller,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                      width: double.infinity,
                    ),
                    GetBuilder<peoplegetxController>(builder: (data) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                              onPressed: () async {
                                ;

                                final DocValues = PeoplesModel(
                                  sortid: DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString(),
                                  age: agecontroller.text,
                                  adress: adresscontroller.text,
                                  imgurl: data.userImageUrl,
                                  name: namecontroller.text,
                                );

                                final doc = FirebaseFirestore.instance
                                    .collection('peoples')
                                    .doc();

                                DocValues.uid = doc.id;

                                final values = DocValues.toMap();
                                await doc.set(values);

                                namecontroller.text = '';
                                agecontroller.text = '';
                                adresscontroller.text = '';
                                getcontroller.imageurl = null;

                                // log(DocValues.uid.toString());

                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kblackcolor,
                                  foregroundColor: kwhitecolor),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
