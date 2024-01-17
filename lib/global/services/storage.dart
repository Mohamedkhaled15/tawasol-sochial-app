import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  uploadImageToStorage(File file) async {
    String id = const Uuid().v1();
    Reference ref =
        _storage.ref().child('posts').child(_auth.currentUser!.uid).child(id);

    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();

    return url;
  }
}
