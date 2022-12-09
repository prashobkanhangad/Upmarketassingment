import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/domain/controller/getxcontroller.dart';
import 'package:upmark_assignment/domain/model/model.dart';
import 'package:upmark_assignment/presentation/homepage/widgets/textformfieldwidget.dart';

class PeopleslistviewWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  PeopleslistviewWidget({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final getcontroller = Get.put(peoplegetxController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = PeoplesModel.fromMap(snapshot.data!.docs[index].data());

          return Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                Expanded(
                  child: SizedBox(
                    width: 30,
                    child: IconButton(
                        onPressed: () {
                          print('Delete');

                          final docUser = FirebaseFirestore.instance
                              .collection('peoples')
                              .doc(data.uid);

                          docUser.delete();
                        },
                        icon: Icon(Icons.delete, size: 25)),
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    width: 70,
                  ),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    color: kwhitecolor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: data.imgurl == null
                                    ? const AssetImage(
                                            'asset/136-1366211_group-of-10-guys-login-user-icon-png.png')
                                        as ImageProvider
                                    : NetworkImage(data.imgurl, scale: 1.2)),
                            color: kgreycolor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: textbold20,
                            ),
                            Text(
                              'Age: ${data.age}',
                              style: textnormal18,
                            ),
                            Text(
                              'Adress: ${data.adress}',
                              style: textnormal16,
                            )
                          ]),
                      Spacer(),
                      Column(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () => showeditbottomsheetmethod(context,
                                age: data.age,
                                adress: data.adress,
                                imgurl: data.imgurl,
                                name: data.name,
                                uid: data.uid),
                            child: Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: kblackcolor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: const Center(
                                child: Text(
                                  'EDIT',
                                  style: TextStyle(color: kwhitecolor),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: snapshot.data == null ? 0 : snapshot.data.size);
  }

  Future<dynamic> showeditbottomsheetmethod(BuildContext context,
      {required name,
      required age,
      required adress,
      required imgurl,
      required uid}) {
    final TextEditingController nameeditcontroller = TextEditingController();
    final TextEditingController ageeditcontroller = TextEditingController();
    final TextEditingController adresseditcontroller = TextEditingController();

    nameeditcontroller.text = name;

    ageeditcontroller.text = age;
    adresseditcontroller.text = adress;

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
                      'Update Details Of User',
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
                          Column(
                            children: [
                              Container(
                                  width: screenwidth * 0.4,
                                  height: screenwidth * 0.33,
                                  decoration: BoxDecoration(
                                      color: kgreycolor,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: imgurl == null
                                              ? AssetImage(
                                                      'asset/136-1366211_group-of-10-guys-login-user-icon-png.png')
                                                  as ImageProvider
                                              : NetworkImage(imgurl)),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)))),
                              GestureDetector(
                                onTap: () => getcontroller.userImagePicker(),
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
                                            fontSize: 18, color: kwhitecolor),
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
                                  controller: nameeditcontroller,
                                  hinttext: 'Name',
                                ),
                                textformfieldwidget(
                                  keyboardtype: TextInputType.number,
                                  controller: ageeditcontroller,
                                  hinttext: 'Age',
                                ),
                                textformfieldwidget(
                                  controller: adresseditcontroller,
                                  hinttext: 'Adress',
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                            onPressed: () {
                              final updatedfinal = PeoplesModel(
                                
                               
                                  age: ageeditcontroller.text,
                                  adress: adresseditcontroller.text,
                                  imgurl: imgurl,
                                  name: nameeditcontroller.text);

                              final updatedmap = updatedfinal.toMap();
                              //  log(updatedmap.toString());

                              final doc = FirebaseFirestore.instance
                                  .collection('peoples')
                                  .doc(uid)
                                  .update(updatedmap);
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
                    ),
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
