import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MissionCard extends StatelessWidget {
  final String icon, title, subtitle;

  const MissionCard({Key key, this.icon, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(icon,style: TextStyle(fontSize: 22),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 5,),
            ConstrainedBox(
              constraints:
              BoxConstraints(maxWidth: screenSize.width * .7),
              child: Text(subtitle,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.85),
                    fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
