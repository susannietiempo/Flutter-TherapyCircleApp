import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedTextFieldState extends StatelessWidget {
  RoundedTextFieldState(
      {this.icon,
      this.hint,
      this.obsecure = false,
      this.validator,
      this.onSaved,
      this.color});
  final FormFieldSetter<String> onSaved;
  final Icon icon;
  final String hint;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        autofocus: true,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.ptSansNarrow(
            fontSize: 16,
            color: Color(0xFF545454),
          ),
          hintText: hint,
          filled: true,
          fillColor: color,
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).primaryColor),
              child: icon,
            ),
            padding: EdgeInsets.only(left: 15, right: 10),
          ),
        ),
      ),
    );
  }
}
