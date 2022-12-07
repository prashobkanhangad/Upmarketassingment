
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:upmark_assignment/core/constants.dart';

class PeopleslistviewWidget extends StatelessWidget {
  const PeopleslistviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
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
                            color: kgreycolor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Name of Person',
                              style: textbold20,
                            ),
                            Text(
                              'Age: ',
                              style: textnormal18,
                            ),
                            Text(
                              'Adress: ',
                              style: textnormal16,
                            )
                          ]),
                      Spacer(),
                      Column(
                        children: [
                          Spacer(),
                          Container(
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
        itemCount: 15);
  }
}
