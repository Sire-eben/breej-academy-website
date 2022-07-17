import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomText extends StatelessWidget {
  final String mainText;
  final String secondaryText;

  const BottomText({Key key, this.mainText, this.secondaryText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: [
        TextSpan(text: '$mainText \n'),
        TextSpan(text: secondaryText,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        )),
      ],
      style: GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.bold
      )
    ));
  }
}
