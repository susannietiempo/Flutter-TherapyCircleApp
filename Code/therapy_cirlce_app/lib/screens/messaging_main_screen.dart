import 'package:flutter/material.dart';


class ConversationScreen extends StatefulWidget {
    static const String id = 'conversation_screen';
    final String chatRoomId;

  ConversationScreen({this.chatRoomId});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('messages'),
    );
  }
}