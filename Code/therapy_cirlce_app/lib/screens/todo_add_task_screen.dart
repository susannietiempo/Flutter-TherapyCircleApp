import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_cirlce_app/models/task_info.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSans(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF5370ff),
                ),
            ),
            TextField(
              autofocus: true,
              style:GoogleFonts.ptSansNarrow(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: GoogleFonts.ptSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              color: Color(0XFF5370ff),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
