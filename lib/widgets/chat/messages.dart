import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chat/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy(
              'date',
              descending: true,
            )
            .snapshots(),
        builder: (context, chatSnapshot) {
          if (chatSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final chat = chatSnapshot.data.documents;
          return ListView.builder(
            reverse: true,
            itemCount: chat.length,
            itemBuilder: (context, index) => MessageBubble(
              chat[index].data()['username'],
              chat[index].data()['text'],
              chat[index].data()['userImage'],
              chat[index].data()['userId'] == user.uid,
              key: ValueKey(chat[index].documentID),
            ),
          );
        });
  }
}
