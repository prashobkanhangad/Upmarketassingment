import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/domain/model/model.dart';
import 'package:upmark_assignment/presentation/homepage/widgets/textformfieldwidget.dart';

class PeopleslistviewWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const PeopleslistviewWidget({Key? key, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = PeoplesModel.fromMap(snapshot.data!.docs[index].data());
          // log(data.name);
          return Slidable(
            endActionPane: const ActionPane(
              motion: StretchMotion(),
              children: [
                SizedBox(
                  width: 40,
                  child: Icon(Icons.delete),
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
                            image: DecorationImage(fit: BoxFit.cover,
                                image: FileImage(File(data.imgurl))),
                            color: kgreycolor),
                      ),
                      SizedBox(
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
                            onTap: () => showeditbottomsheetmethod(context),
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
        itemCount: snapshot.data.size);
  }

  Future<dynamic> showeditbottomsheetmethod(BuildContext context) {
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
                          Container(
                            width: screenwidth * 0.4,
                            height: screenwidth * 0.4,
                            decoration: BoxDecoration(
                                color: kgreycolor,
                                borderRadius: BorderRadius.circular(5)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt)),
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
                              children: const [
                                // textformfieldwidget(controller: name,
                                //   hinttext: 'Name',
                                // ),
                                // textformfieldwidget(
                                //   hinttext: 'Age',
                                // ),
                                // textformfieldwidget(
                                //   hinttext: 'Adress',
                                // ),
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
                            onPressed: () {},
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
