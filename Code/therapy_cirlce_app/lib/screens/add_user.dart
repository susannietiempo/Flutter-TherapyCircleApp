import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:therapy_cirlce_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapy_cirlce_app/widgets/helper_functions.dart';

class AddUser extends StatefulWidget {
  static const String id = 'adduser_screen';

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;

  TextEditingController searchController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  QuerySnapshot searchSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    if (searchController.text.trim().isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await databaseMethods
          .getUserByEmail(searchController.text.trim())
          .then((snapshot) {
        searchSnapshot = snapshot;
        print("$searchSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  sendMessage(String email) {
    print(email);
    print("${loggedInUser.email}");
    if (email != loggedInUser.email) {
      print(Constants.myEmail);
      List<String> users = [loggedInUser.email, email];

      String chatRoomId = getChatRoomId(loggedInUser.email, email);

      Map<String, dynamic> chatRoom = {
        "users": users,
        "chatRoomId": chatRoomId,
      };

      databaseMethods.addChatRoom(chatRoom, chatRoomId);
     _showAuthFailedDialog();
    }
  }

  Widget userTile({
    String firstName,
    String lastName,
    String email,
  }) {
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
            onTap: () {
              sendMessage(email);
            },
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

  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return userTile(
                firstName: searchSnapshot.documents[index].data["firstName"],
                lastName: searchSnapshot.documents[index].data["lastName"],
                email: searchSnapshot.documents[index].data["email"],
                //onTap: sendMessage(searchSnapshot.documents[index].data["email"])
              );
            })
        : Container();
  }

void _showAuthFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Successful!!',  style: GoogleFonts.ptSans(
                          fontSize: 25,
                          color: Color(0XFFcf5e74),
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),),
          content: new Text('You have added a new member to your circle.', style: GoogleFonts.ptSans(
                          fontSize: 15,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
//create chat room ot send teh user to

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        HelperFunctions.saveUserEmailSharedPreference(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
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

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}


