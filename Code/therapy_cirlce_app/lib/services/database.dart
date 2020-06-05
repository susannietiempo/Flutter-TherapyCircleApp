
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

  updateTask(email, taskList)  {
    Firestore.instance.collection("tasks")..document(email).updateData({'task': taskList});
  }



  getTasks(String email) async => Firestore.instance
          .collection("tasks")
          .where("email", isEqualTo: email)
          .getDocuments()
          .catchError((e) {
        print(e.toString());
      });

  
}
