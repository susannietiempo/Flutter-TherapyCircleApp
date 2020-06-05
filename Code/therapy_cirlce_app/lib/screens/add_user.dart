import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:therapy_cirlce_app/screens/messaging_main_screen.dart';
import 'package:therapy_cirlce_app/screens/welcome_screen.dart';
import 'package:therapy_cirlce_app/services/authentication.dart';
import 'package:therapy_cirlce_app/screens/search_user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:therapy_cirlce_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddUser extends StatefulWidget {
  static const String id = 'adduser_screen';

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController searchController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot searchSnapshot;
  
  bool isLoading = false;
  bool haveUserSearched = false;


  initiateSearch() async {
    if(searchController.text.trim().isNotEmpty){
      setState(() {
        isLoading = true;
      });
      await databaseMethods.getUserByEmail(searchController.text.trim())
          .then((snapshot){
        searchSnapshot = snapshot;
        print("$searchSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

 Widget userList(){
    return haveUserSearched ? ListView.builder(
      shrinkWrap: true,
      itemCount: searchSnapshot.documents.length,
        itemBuilder: (context, index){
        return SearchTile(
         firstName: searchSnapshot.documents[index].data["firstName"],
          lastName: searchSnapshot.documents[index].data["lastName"],
          email: searchSnapshot.documents[index].data["email"],
        );
        }) : Container();
  }

//create chat room ot send teh user to
  sendMessage(String email){
    List<String> users = [Constants.myEmail,email];

    String chatRoomId = getChatRoomId(Constants.myEmail,email);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId" : chatRoomId,
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => ConversationScreen(
        chatRoomId: chatRoomId,
      )
    ));

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
                    'Add Member',
                    style: kHeadingText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xFFe2d5c2),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: GoogleFonts.ptSans(
                        fontSize: 20,
                        color: Color(0XFF545454),
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                          hintText: "search email address...",
                          hintStyle: GoogleFonts.ptSans(
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x70cf5e74),
                            const Color(0x70cf5e74),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            userList()
          ],
        ), //chatRoomsList(),
      ),
    );
  }
}

//TODO Refactor this

class SearchTile extends StatelessWidget {
  final String email;
  final String firstName;
  final String lastName;

  SearchTile({this.email, this.firstName, this.lastName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.blue[100],
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${firstName} ${lastName}',
                  style: GoogleFonts.ptSansNarrow(
                    fontSize: 20,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  )),
              Text(
                email,
                style: GoogleFonts.ptSansNarrow(
                  fontSize: 20,
                  color: Color(0xFF3b3a3a),
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                'Add to My Circle',
                style: GoogleFonts.ptSansNarrow(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }