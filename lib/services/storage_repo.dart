import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepo extends GetxController {
  static StorageRepo get instance => Get.find();
  final storage =
      FirebaseStorage.instanceFor(bucket: "gs://eduhome-ec721.appspot.com/");

  Future<String> uploadFile(XFile file, String filename) async {
    var storageRef = storage.ref().child("images/${filename}");
    File pic = File(file.path);
    var uploadTask = storageRef.putFile(pic);

    await uploadTask.whenComplete(() => null);
    String url = await storageRef.getDownloadURL();
    return url;
  }
}
