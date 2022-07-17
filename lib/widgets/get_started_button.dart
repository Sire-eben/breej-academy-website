import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

class GetStartedButton extends StatelessWidget {
  final String text;

  const GetStartedButton({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 45,
        width: 200,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        decoration: BoxDecoration(
          color: active,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_right_alt, color: kWhiteColor,)
          ],
        ),
      );
  }
}
