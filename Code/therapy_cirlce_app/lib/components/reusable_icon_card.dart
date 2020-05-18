import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableIconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color mainColor;
  final Color secColor;

  ReusableIconCard({@required this.icon, @required this.text, this.mainColor, this.secColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight,
              end: Alignment.bottomLeft,colors: [mainColor, secColor,]),
          color: mainColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), 
            ),],),
          child: Icon(
            icon,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: GoogleFonts.ptSansNarrow(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Color(0Xff46578f),
          ),
        ),
      ],
    );
  }
}
