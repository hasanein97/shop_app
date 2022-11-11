import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underLine;
  TextUtils(
      {required this.underLine,
        required this.color,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          decoration:underLine,
            color:color,
            fontSize: fontSize,
            fontWeight: fontWeight,
        ),
      ),
    );
  }
}
