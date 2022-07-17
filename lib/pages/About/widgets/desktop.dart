import 'package:breej_academy/constants/constants.dart';
import 'package:breej_academy/pages/community/components/team_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
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
                        color: Colors.white70,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenSize.height,
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,vertical:screenSize.width * .1,),
            decoration: BoxDecoration(
              color: Color(0xFFC4C4C4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("MISSION", style: TextStyle(
                  color: active, fontSize: 30, fontWeight:  FontWeight.bold,
                ),),
                kConstHeight,
                Image.asset("assets/images/mission.png",
                height: screenSize.height * .3,),
                kConstHeight,
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: screenSize.width * .5),
                  child: Text(
                    "We are on a mission to build an alternate solution to the conventional education in Africa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: screenSize.height,
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,vertical:screenSize.width * .1,),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CORE VALUES", style: TextStyle(
                  color: active, fontSize: 30, fontWeight:  FontWeight.bold,
                ),),
                kConstHeight,
                Image.asset("assets/images/core values.png",
                height: screenSize.height * .3,),
                kConstHeight,
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: screenSize.width * .5),
                  child: Text(
                    "We are on a mission to build an alternate solution to the conventional education in Africa",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),

          // Container(
          //   color: Colors.white,
          //   width: screenSize.width,
          //   padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Column(
          //         children: [
          //           Text(
          //             "🎯\nOur Mission",
          //             textAlign: TextAlign.center,
          //             style: GoogleFonts.poppins(
          //                 fontSize: 18,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.w700),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           ConstrainedBox(
          //             constraints: BoxConstraints(maxWidth: screenSize.width*.3),
          //             child: Text(
          //               "We are on a mission to build an alternate solution to the "
          //               "conventional education in Africa.",
          //               textAlign: TextAlign.center,
          //               style: GoogleFonts.poppins(
          //                   fontSize: 12,
          //                   color: Colors.black.withOpacity(0.85),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         width: 70,
          //       ),
          //       Column(
          //         children: [
          //           Text(
          //             "💎\nOur Core Values",
          //             textAlign: TextAlign.center,
          //             style: GoogleFonts.poppins(
          //                 fontSize: 18,
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.w700),
          //           ),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           ConstrainedBox(
          //             constraints: BoxConstraints(maxWidth: screenSize.width*.3),
          //             child: Text(
          //               "We are here to embrace and drive change and so our institution is established upon "
          //               "Trust, Excellence, Dedication, Humility and Hard work",
          //               textAlign: TextAlign.center,
          //               style: GoogleFonts.poppins(
          //                   fontSize: 12,
          //                   color: Colors.black.withOpacity(0.85),
          //                   fontWeight: FontWeight.normal),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

          // Container(
          //   width: screenSize.width,
          //   padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,vertical:screenSize.width * .1,),
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Expanded(
          //           flex: 1,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("MEET THE\nTEAM",
          //                 textAlign: TextAlign.left,
          //                 style: GoogleFonts.poppins(
          //                     fontSize: 30,
          //                     color: Colors.black,
          //                     fontWeight: FontWeight.w900),
          //               ),
          //               kConstHeight,
          //               ConstrainedBox(
          //                 constraints: BoxConstraints(maxWidth: screenSize.width * .2),
          //                 child: Text(
          //                   "The Breej Global is an education technology company building an "
          //                       "career in tech",
          //                   textAlign: TextAlign.left,
          //                   style: GoogleFonts.poppins(
          //                       fontSize: 14,
          //                       color: Colors.black54,
          //                       fontWeight: FontWeight.normal),
          //                 ),
          //               ),
          //             ],
          //           ),),
          //       Expanded(
          //         flex: 3,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //            Row(
          //              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //              children: const [
          //              TeamCard(name: "Ajewole Ebenezer", position: "Founder/CEO", imageUrl: "assets/team/eben.png",),
          //              TeamCard(name: "Chidera Ugo", position: "CTO", imageUrl: "assets/team/Evangel.jpg",),
          //              TeamCard(name: "Dayo Adetoro", position: "CGO", imageUrl: "",),
          //              TeamCard(name: "Queen Estrom", position: "Marketing", imageUrl: "assets/team/queen.jpeg",),
          //            ],
          //            ),
          //            kConstHeight,
          //            kConstHeight,
          //            Row(
          //              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //              children: const [
          //              TeamCard(name: "Prince Ekpeoha", position: "Design (Graphics)", imageUrl: "assets/team/prince.jpeg",),
          //              TeamCard(name: "David Adetoro", position: "Design (UI/UX)", imageUrl: "",),
          //              TeamCard(name: "Victory Salawu", position: "Legal", imageUrl: "assets/team/victory.png",),
          //            ],
          //            ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
