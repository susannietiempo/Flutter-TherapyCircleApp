import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const Color kLightGray = Color(0XFFadadad);

const kSendButtonTextStyle = TextStyle(
  color: Colors.orange,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.orangeAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Color(0x44f2bd20),
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  focusColor: Color(0xFFf2bd20),
  border: UnderlineInputBorder(borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.blue, Color(0xff9bacfd), Colors.lightBlueAccent]);

final TextStyle kappBarText = GoogleFonts.ptSans(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff5271fe));

final TextStyle kHeadingText = GoogleFonts.ptSansNarrow(
    fontSize: 25,      
    fontWeight: FontWeight.bold,
    color: Color(0xFF545454),
    );

