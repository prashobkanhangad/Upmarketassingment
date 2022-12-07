import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:upmark_assignment/core/constants.dart';
import 'package:upmark_assignment/presentation/homepage/widgets/peopleslistviewwidget.dart';
import 'package:upmark_assignment/presentation/homepage/widgets/textformfieldwidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('LIst Of Peoples'),
        // centerTitle: true,
        backgroundColor: kblackcolor,
      ),
      body: SafeArea(
          child: Container(
        color: kashcolor,
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
            const PeopleslistviewWidget()
          ],
        ),
      )),
    );
  }

  Future<dynamic> showbottomsheetmethod(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return showModalBottomSheet(isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 280,
            child: Padding(
              padding: EdgeInsets.all(5),
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
                    Divider(),
                    SizedBox(height:5 ,),
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
                                borderRadius: BorderRadius.circular(5)),child: IconButton(onPressed: () {
                                  
                                }, icon: Icon(Icons.camera_alt)),
                          ),SizedBox(width: 10,),
                  
                          SizedBox(
                            width: screenwidth * 0.6-30,
                            height: screenwidth * 0.4,
                            // color: kgreycolor,
                            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                
                                textformfieldwidget(
                                  hinttext: 'Name',
                                ),
                                textformfieldwidget(
                                  hinttext: 'Age',
                                ),
                                textformfieldwidget(
                                  hinttext: 'Adress',
                                ),
                                

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),SizedBox(height: 10, width: double.infinity,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                            onPressed: () {
                            
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
