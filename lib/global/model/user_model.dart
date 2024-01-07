import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uId;
  String email;
  String phone;
  String userName;
  String displayName;
  String bio;
  String profilePic;
  List followers;
  List following;

  UserModel(
      {required this.uId,
      required this.email,
      required this.userName,
      required this.displayName,
      required this.bio,
      required this.profilePic,
      required this.followers,
      required this.following,
      required this.phone});

  factory UserModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
        uId: snapshot['uId'],
        email: snapshot['email'],
        userName: snapshot['userName'],
        displayName: snapshot['displayName'],
        bio: snapshot['bio'],
        profilePic: snapshot['profilePic'],
        followers: snapshot['followers'],
        following: snapshot['following'],
        phone: snapshot['phone']);
  }

  Map<String, dynamic> toJson() => {
        "uId": uId,
        "email": email,
        "userName": userName,
        "displayName": displayName,
        "bio": bio,
        "profilePic": profilePic,
        "followers": followers,
        "following": following,
        "phone": phone
      };
}
