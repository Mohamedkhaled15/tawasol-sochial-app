import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:templet/global/model/post.dart';
import 'package:templet/global/services/storage.dart';
import 'package:uuid/uuid.dart';

class CloudMethods {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  uploadPost({
    required String description,
    required String uid,
    required String username,
    String? profilePic,
    File? file,
    required String displayName,
  }) async {
    String res = "Some Error";

    try {
      String postId = const Uuid().v1();
      String postImage = await StorageMethods().uploadImageToStorage(file!);
      PostModel postModel = PostModel(
          uId: uid,
          userName: username,
          displayName: displayName,
          profilePic: profilePic ?? "",
          date: DateTime.now(),
          description: description,
          like: [],
          postImage: postImage,
          postId: postId);

      posts.doc(postId).set(postModel.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
