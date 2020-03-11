import 'package:flutter/material.dart';
import 'package:mood_frontend/models/chatbot_reply.dart';
import '../constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chat_message_bubble.dart';
import '../services/chatbot.dart';

final _firestore = Firestore.instance;
const collectionName = 'messages';
FirebaseUser loggedInUser;
ChatbotReply chatbotReply;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getMessageStream() async {
    await for (var snapshot
        in _firestore.collection(collectionName).snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.music_note,
                color: Colors.white,
              ),
              onPressed: () {
                getMessageStream();
                //Implement logout functionality
              }),
        ],
        title: Text(
          '⚡️Chat',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF030303),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    icon: Icon(
                      Icons.send,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      messageTextController.clear();
                      print(
                          'logged user email: ${loggedInUser.email} \n $messageText');
                      _firestore.collection('messages').add(
                        {
                          'text': messageText,
                          'sender': loggedInUser.email,
                          // 'date': DateTime.now().toIso8601String().toString()
                          'date': FieldValue.serverTimestamp()
                        },
                      );
                      chatbotReply = await chatbotPostMethod(
                          'https://moodrestapi.herokuapp.com/rest-apis/rest-get/',
                          {'message': '$messageText'});

                      _firestore.collection(collectionName).add(
                        {
                          'text': chatbotReply.reply,
                          'sender': 'bot',
                          'date': FieldValue.serverTimestamp()
                        },
                      );

                      chatbotReply.tones.forEach(
                        (var t) {
                          print(t);
                        },
                      );
                    },
                    // child: Text(
                    //   'Send',
                    //   style: kSendButtonTextStyle,
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(collectionName).orderBy('date').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents.reversed;
        List<ChatMessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = ChatMessageBubble(
            // detectEmotion: chatbotReply.tones.toString(),
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
