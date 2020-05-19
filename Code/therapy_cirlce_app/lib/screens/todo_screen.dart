import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/models/task_info.dart';
import 'package:provider/provider.dart';
import 'package:therapy_cirlce_app/screens/todo_add_task_screen.dart';
import 'package:therapy_cirlce_app/widgets/task_list.dart';
import 'package:therapy_cirlce_app/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ToDoScreen extends StatelessWidget {
    static const String id = 'todo_screen';

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[   Icon(FontAwesomeIcons.ellipsisV, color: Color(0xFF46578f),), Padding(padding: EdgeInsets.only(right:25),)],
          title: Center(
            child: Text(
              'My Therapy To Do\'s',
              style: kappBarText,
            ),
          ),
        ),
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                    child:Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(),
                    )
                )
            );
          }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),

                 SizedBox(
                  height: 10.0,
                ),
                Text(
                  'You have ${Provider.of<TaskData>(context).taskCount} active tasks',
                  style: kappBarText.copyWith(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
