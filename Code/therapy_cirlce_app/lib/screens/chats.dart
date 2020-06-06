
import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy_cirlce_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:therapy_cirlce_app/widgets/helper_functions.dart';

class Chat extends StatefulWidget {
  static const String id = 'chats2_screen';

  final String chatRoomId;

  Chat({this.chatRoomId});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  Stream chatMessagesStream;

  Widget chatMessages() {
    return StreamBuilder(
      stream: chatMessagesStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                    message: snapshot.data.documents[index].data["message"],
                    sendByMe: Constants.myEmail ==
                        snapshot.data.documents[index].data["sendBy"],
                  );
                })
            : Container();
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": Constants.myEmail,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseMethods().addConversationMessages(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    getUserInfo();
    DatabaseMethods().getConversationMessages(widget.chatRoomId).then((val) {
      setState(() {
        chatMessagesStream = val;
        print('Here Chat ${Constants.myEmail}');
          print('Here ChatID ${Chat().chatRoomId}');
      });
    });
    super.initState();
  }

  getUserInfo() async{
    Constants.myEmail = await HelperFunctions.getUserEmailSharedPreference();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 15,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 10, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: ExactAssetImage(
                        'images/logo_circle_yellow.png',
                        scale: 1.0),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Messages',
                    style: kHeadingText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            chatMessages(),
            Container(
              color: Colors.black12,
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: Color(0xFFe2d5c2),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: messageEditingController,
                      style: GoogleFonts.ptSansNarrow(
                        fontSize: 20,
                        color: Color(0xFF3b3a3a),
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                          hintText: "Type your message ...",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          border: InputBorder.none),
                    )),
                    SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        addMessage();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xffcf5e74),
                                  const Color(0xffcf5e74)
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight),
                            borderRadius: BorderRadius.circular(40)),
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
//
  MessageTile({@required this.message,  this.sendByMe});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          top: 8, bottom: 8, left: sendByMe ? 0 : 24, right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin:
            sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe
                  ? [const Color(0x60ef748c), const Color(0x60ef748c)]
                  : [const Color(0xffbfe5ef), const Color(0xffbfe5ef)],
            )),
        child: Text(message,
            textAlign: TextAlign.start,
            style: GoogleFonts.ptSansNarrow(
                    fontSize: 20,
                    color: Color(0Xf83b3a3a),
                    decoration: TextDecoration.none,
                  )),
      ),
    );
  }
}
