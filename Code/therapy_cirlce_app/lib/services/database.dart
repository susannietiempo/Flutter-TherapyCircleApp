import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByEmail(String email) async {
    return await Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  Future<bool> addTaskDocument(email, taskList) {
    Firestore.instance
        .collection("tasks")
        .document(email)
        .setData(taskList)
        .catchError((e) {
      print(e);
    });
  }

  updateTask(email, taskList) {
    Firestore.instance.collection("tasks")
      ..document(email).updateData({'task': taskList});
  }

  getTasks() async =>
      Firestore.instance.collection("tasks").getDocuments().catchError((e) {
        print(e.toString());
      });

  getChats(String chatRoomId) async {
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  getConversationMessages(String chatRoomId) async {
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  addConversationMessages(String chatRoomId, messageMap) async {
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  getChatRooms(String email) {
    return Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: email)
        .snapshots();
  }
} //end db
