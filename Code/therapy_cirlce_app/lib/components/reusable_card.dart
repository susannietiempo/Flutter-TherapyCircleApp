import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.cardChild, this.onPress, this.gradient});
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  final Gradient gradient; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: gradient,
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), 
            ),
          ],
        ),
      ),
    );
  }
}
