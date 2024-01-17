import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String uId;
  String userName;
  String displayName;
  String profilePic;
  String description;
  String postId;
  String postImage;
  DateTime date;
  dynamic like;

  PostModel({
    required this.uId,
    required this.userName,
    required this.displayName,
    required this.profilePic,
    required this.date,
    required this.description,
    required this.postId,
    required this.like,
    required this.postImage,
  });

  factory PostModel.fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return PostModel(
      uId: snapshot['uId'],
      userName: snapshot['userName'],
      displayName: snapshot['displayName'],
      profilePic: snapshot['profilePic'],
      date: snapshot['date'],
      description: snapshot['description'],
      like: snapshot['like'],
      postId: snapshot['postId'],
      postImage: snapshot['postImage'],
    );
  }

  Map<String, dynamic> toJson() => {
        "uId": uId,
        "userName": userName,
        "displayName": displayName,
        "profilePic": profilePic,
        "date": date,
        "description": description,
        "like": like,
        "postId": postId,
        "postImage": postImage,
      };
}
