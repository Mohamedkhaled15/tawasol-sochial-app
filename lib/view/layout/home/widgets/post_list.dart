import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tawasol/view/layout/home/widgets/post_widget.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    return StreamBuilder(
        stream: posts.orderBy('date', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              dynamic data = snapshot.data! as dynamic;
              return PostWidget(
                data: data,
                index: index,
              );
            },
          );
        });
  }
}
