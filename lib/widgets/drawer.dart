import 'package:breej_academy/navigation/navigation.dart';
import 'package:breej_academy/pages/contact/contact_us.dart';
import 'package:breej_academy/pages/registration/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import '../pages/About/about_us.dart';
import '../pages/home/home.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final Uri url = Uri.parse('https://app.breej.africa');

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: screenSize.height * .4,
        width: screenSize.width * .85,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)]),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 16),
              ),
            ),
            kConstHeight,
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
              child: const Text(
                'About Us',
                style: TextStyle(fontSize: 16),
              ),
            ),
            kConstHeight,
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
              child: const Text(
                'Contact Us',
                style: TextStyle(fontSize: 16),
              ),
            ),
            kConstHeight,
            InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ContactUsPage( )));
              },
              child: const Text(
                'Blog',
                style: TextStyle(fontSize: 16),
              ),
            ),
            InkWell(
              onTap: () async {
                pageNavigation(context, RegistrationForm());
               // if (!await launchUrl(url)) throw 'Could not launch $url';
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: screenSize.width * .7,
                decoration: BoxDecoration(
                  color: active,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
