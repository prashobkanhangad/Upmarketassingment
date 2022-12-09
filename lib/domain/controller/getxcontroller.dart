// import 'dart:developer';

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class peoplegetxController extends GetxController {
  XFile? imageurl;
  String userImageUrl = '';

  getvalue() {
    FirebaseFirestore.instance.collection('peoples').doc().get().then((value) {
      print(value);
    });
  }


   userImagePicker() async {
    final uniqueProductImageName = DateTime.now().microsecondsSinceEpoch;
    imageurl = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectoryImages =
        referenceRoot.child('upmark/');
    Reference referenceImageToUpload =
        referenceDirectoryImages.child(uniqueProductImageName.toString());
    // log(uniqueProductImageName.toString());
    if (imageurl == null) {
      return;
    }
    try { 
      await referenceImageToUpload.putFile(File(imageurl!.path));

      userImageUrl = await referenceImageToUpload.getDownloadURL();
      log(userImageUrl);
    } catch (e) {
      // log(e.toString());
    }

    update();
  }
}
