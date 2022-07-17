import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: screenSize.height * .9,
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,vertical:screenSize.width * .1,),
            decoration: BoxDecoration(
              color: active,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ABOUT US",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                kConstHeight,
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: screenSize.width * .5),
                  child: Text(
                    "The Breej Global is an education technology company building an "
                        "alternate educational system for African youths who want to kickstart a career in tech",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.85),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.white,
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,vertical:screenSize.width * .1,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                "Mission",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: active,
                    fontWeight: FontWeight.bold),
              ),
                Padding(
                  padding: EdgeInsets.all(screenSize.height * .1),
                  child: Image.asset("assets/images/mission.png", height: screenSize.height* .3,),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: screenSize.width*.5),
                  child: Text(
                    "We are on a mission to build an alternate solution to the "
                        "conventional education in Africa.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.85),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),

          ///===CORE VALUES===///
          Container(
            color: Color(0xFFFFFFFF),
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,vertical:screenSize.width * .1,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(
                "Core Values",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: active,
                    fontWeight: FontWeight.bold),
              ),
                Padding(
                  padding: EdgeInsets.all(screenSize.height * .1),
                  child: Image.asset("assets/images/core values.png", height: screenSize.height* .3,),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: screenSize.width*.5),
                  child: Text("We are here to embrace and drive change and so our institution is estalished upon trust, excellence, dedication, humility, and hard work",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.85),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
