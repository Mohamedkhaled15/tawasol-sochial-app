import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:templet/global/model/user_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  signUp({
    required String email,
    required String password,
    required String username,
    required String display,
    required String phone,
  }) async {
    String res = "Some Error";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          display.isNotEmpty ||
          phone.isNotEmpty) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          email: email,
          userName: username,
          displayName: display,
          phone: phone,
          bio: "",
          profilePic: "",
          followers: [],
          following: [],
        );
        FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(userModel.toJson());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on Exception catch (e) {
      return e.toString();
    }
    return res;
  }

  signIn({
    required String email,
    required String password,
  }) async {
    String res = "Some Error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } on Exception catch (e) {
      print(e);
    }
    return res;
  }
}
