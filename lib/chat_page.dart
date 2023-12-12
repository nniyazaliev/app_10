import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String email;
  final String userId;

  const ChatPage({
    Key? key,
    required this.email,
    required this.userId,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final firestore = FirebaseFirestore.instance;

  Future<void> sendMessage(String userId, String email) async {
    await firestore.collection('chat').add(
      {
        "message": "Kayaka?",
        "userId": userId,
        "name": email,
      },
    );

    // await firestore.collection('chat').doc(userId).set(
    //   {
    //     "message": "Kayaka?",
    //     "userId": userId,
    //     "name": email,
    //   },
    //   SetOptions(merge: true),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('email: ${widget.email}'),
          Text('User id: ${widget.userId}'),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
              right: 10,
              left: 10,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: InkWell(
                  onTap: () async {
                    await sendMessage(widget.userId, widget.email);
                  },
                  child: Icon(Icons.send),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
