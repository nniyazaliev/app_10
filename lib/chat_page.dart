import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  TextEditingController messageController = TextEditingController();

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMessages() {
    return firestore
        .collection('chat')
        .orderBy('date', descending: false)
        .snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getFutureMessages() {
    return firestore.collection('chat').get();
  }

  Future<void> sendMessage(String userId, String email) async {
    await firestore.collection('chat').add(
      {
        "message": messageController.text,
        "userId": userId,
        "name": email,
        "date": DateTime.now(),
      },
    );

    messageController.clear();
    FocusManager.instance.primaryFocus?.unfocus();

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
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: getStreamMessages(),
                builder: (context, snapshot) {
                  var docs = snapshot.data?.docs;

                  if (docs != null) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final data = docs[index].data();

                        bool isMe = data['userId'] == widget.userId;

                        final timestamp = data['date'] as Timestamp;
                        //log('date = ${date.runtimeType}');

                        var dateTime = DateTime.fromMillisecondsSinceEpoch(
                          timestamp.millisecondsSinceEpoch * 1000,
                        );

                        var date = DateFormat('MM/dd/yyyy, hh:mm a')
                            .add_yMMMd()
                            .format(dateTime);

                        log('readableDate = $date  ||  ${date.runtimeType}');

                        if (isMe) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${data["message"]}',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontSize: 17,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$date',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontSize: 5,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      '${data["message"]}',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontSize: 17,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '$date',
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontStyle: FontStyle.normal,
                                          fontSize: 5,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }

                  return SizedBox();
                }),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10.0,
                right: 10,
                left: 10,
              ),
              child: TextField(
                controller: messageController,
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
        ),
      ),
    );
  }
}
