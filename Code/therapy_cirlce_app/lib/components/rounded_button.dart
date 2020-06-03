import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, this.borderColor, this.textColor, @required this.onPressed});

  final Color colour;
  final Color borderColor;
  final Color textColor;


  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: borderColor, style: BorderStyle.solid, width: 3.0),
            color: colour,
            borderRadius: BorderRadius.circular(30.0)),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 300.0,
          height: 45.0,
          child: Text(
            title,
            style:
                GoogleFonts.ptSansNarrow(color: textColor, fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          
        ),
      ),
    );
  }
}
