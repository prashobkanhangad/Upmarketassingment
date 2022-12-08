// import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class peoplegetxController extends GetxController {
  XFile? imageurl;
  Future<void> picmarketimagefromGallery() async {
    XFile? pickedfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    imageurl = pickedfile;

    if (pickedfile == null) return;
    // log(imageurl!.path.toString());
    update();
  }

  // CollectionReference collectionRef = FirebaseFirestore.instance.collection('peoples');
  // collectionRef.get;
  getvalue() {
    FirebaseFirestore.instance.collection('peoples').doc().get().then((value) {
      print(value);
    });
  }
}
