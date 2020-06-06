import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/screens/add_user.dart';
import 'package:therapy_cirlce_app/services/authentication.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/services/database.dart';
import 'package:therapy_cirlce_app/widgets/helper_functions.dart';
import 'package:therapy_cirlce_app/screens/chats.dart';
import 'package:google_fonts/google_fonts.dart';





class ChatRoom extends StatefulWidget {
    static const String id = 'conversation_screen';

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream chatRooms;

Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    email: snapshot.data.documents[index].data['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myEmail, ""),
                    chatRoomId: snapshot.data.documents[index].data["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfo(); 
    databaseMethods.getChatRooms(Constants.myEmail);

    super.initState();
  }

  getUserInfo() async {
    Constants.myEmail = await HelperFunctions.getUserEmailSharedPreference();
    DatabaseMethods().getUserChats(Constants.myEmail).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myEmail}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
                    'My Chat Rooms',
                    style: kHeadingText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddUser()));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String email;
  final String chatRoomId;

  ChatRoomsTile({this.email,@required this.chatRoomId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chat(
            chatRoomId: chatRoomId,
          )
        ));
      },
      child: Container(
        color:Color(0xFFe2d5c2),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xffdf7a8e),
                  borderRadius: BorderRadius.circular(60)),
              child: Center(
                child: Text(email.substring(0, 1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ptSans(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(email,
                textAlign: TextAlign.start,
                style: GoogleFonts.ptSans(
                          fontSize: 20,
                          color: Color(0X903b3a3a),
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),)
          ],
        ),
      ),
    );
  }
}
