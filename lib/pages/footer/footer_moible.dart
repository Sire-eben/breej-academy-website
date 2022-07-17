import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/constants.dart';


class FooterMobile extends StatefulWidget {
  const FooterMobile({Key key}) : super(key: key);

  @override
  _FooterMobileState createState() => _FooterMobileState();
}

class _FooterMobileState extends State<FooterMobile> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        color: active.withOpacity(.05),
        //color: const Color(0xFFEDEDED),
        height: MediaQuery.of(context).size.height * .95,
        width: screenSize.width,
        padding: EdgeInsets.all(screenSize.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  height: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "The Breej",
                  style: TextStyle(
                      color: kBlackColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
            kConstHeight2,
            Row(
              children: const [
                Icon(CupertinoIcons.location_solid, color: kGreyColor, size: 20,),
                 SizedBox(width: 5,),
                 Text(
                    "Federal Capital Territory Nigeria"),
              ],
            ),
            kConstHeight2,
            Row(
              children: const [
                Icon(CupertinoIcons.mail_solid, color: kGreyColor, size: 20,),
                SizedBox(width: 5,),
                Text("Contact@breej.africa", textAlign: TextAlign.left,),
              ],
            ),
            kConstHeight2,
            Row(
              children: const [
                Icon(CupertinoIcons.phone, color: kGreyColor, size: 20,),
                SizedBox(width: 5,),
                Text("234 704 310 4287", textAlign: TextAlign.left,),
              ],
            ),
            kConstHeight,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Company",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        kConstHeight2,
                        Text(
                          "Courses",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "Centers",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "Privacy policy",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "Terms of use",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "Tuition",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ],
                    )),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Students",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        kConstHeight2,
                        Text(
                          "Students",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "SIWES",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "Internship",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight2,
                        Text(
                          "Certificate",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
            kConstHeight,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Instructors",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        kConstHeight,
                        Text(
                          "Become a tutor",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight,
                        Text(
                          "Tutor login",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ],
                    )),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Students",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        kConstHeight,
                        Text(
                          "Get started",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                        kConstHeight,
                        Text(
                          "Student login",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * .025,
              ),
              child: const Divider(
                thickness: 2,
                color: kGreyColor,
              ),
            ),
            const Text("© 2022 The Breej Global Ltd. All rights reserved", textAlign: TextAlign.left,),
            kConstHeight,
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenSize.width * .6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(FontAwesomeIcons.instagram),
                  Icon(FontAwesomeIcons.linkedin),
                  Icon(FontAwesomeIcons.facebookF),
                  Icon(FontAwesomeIcons.twitter),
                  Icon(FontAwesomeIcons.youtube),
                ],),
            ),
          ],
        ),
    );
  }
}
