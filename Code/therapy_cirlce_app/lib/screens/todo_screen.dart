import 'package:flutter/material.dart';
import 'package:therapy_cirlce_app/models/task_info.dart';
import 'package:provider/provider.dart';
import 'package:therapy_cirlce_app/screens/todo_add_task_screen.dart';
import 'package:therapy_cirlce_app/widgets/task_list.dart';
import 'package:therapy_cirlce_app/constants.dart';

class ToDoScreen extends StatelessWidget {
  static const String id = 'todo_screen';
  

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
                    'My To Do\'s',
                    style: kHeadingText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[100],
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
            );
          }),
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
                  style: kappBarText.copyWith(
                      fontSize: 20, color: Color(0xFF3b3a3a)),
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
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
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
