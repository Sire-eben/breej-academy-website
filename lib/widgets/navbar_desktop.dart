import 'package:breej_academy/pages/contact/contact_us.dart';

import 'package:breej_academy/navigation/navigation.dart';
import 'package:breej_academy/pages/registration/registration_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';
import '../pages/About/about_us.dart';
import '../pages/home/home.dart';
import 'custom_button.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  final List _isHovering = [
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final Uri url = Uri.parse('https://app.breej.africa');

    return PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: Container(
          decoration: BoxDecoration(
            color: active,

          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  pageNavigation(context, HomePage());
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/white logo.png',
                      height: 25,
                    ),
                    const SizedBox(width: 10,),
                    const Text("The Breej",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: screenSize.width / 8),
                  navItem("Home", HomePage(), 0),
                  SizedBox(width: screenSize.width / 20),
                  navItem("About Us", AboutUsPage(), 1),
                  SizedBox(width: screenSize.width / 20),
                  navItem("Contact Us", ContactUsPage(), 2),
                   // SizedBox(width: screenSize.width / 20),
                   // navItem("Become a tutor", RegistrationForm(), 3),
                  SizedBox(width: screenSize.width / 20),
                  InkWell(
                      onTap: () async {
                        pageNavigation(context, RegistrationForm());
                        //if (!await launchUrl(_url)) throw 'Could not launch $_url';
                        // showDialog(context: context, builder: (context){
                        //   return AlertDialog(
                        //     title: Text("Unavailable", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black54),),
                        //     content: Text("Login portal still in progress", style: TextStyle(fontSize: 12, color: Colors.black54),),
                        //   actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("Ok",style: TextStyle(color: kBlackColor, fontWeight: FontWeight.w700),))],
                        //   );
                        // });
                      },
                      child: CustomButton(
                        text: 'Register',
                        color: Colors.white,
                        textColor: active,
                      )),
                  SizedBox(width: screenSize.width / 20),
                ],
              ))
            ],
          ),
        ));
  }
  navItem(String item, Widget page, int number){
    return InkWell(
      onHover: (value) {
        setState(() {
          value ? _isHovering[number] = true : _isHovering[number] = false;
        });
      },
      hoverColor: Colors.transparent,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => page));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(item,
            style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _isHovering[number] ? Colors.white : Colors.white70),
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(
              visible: _isHovering[number],
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ))
        ],
      ),
    );
  }
}
