import 'package:breej_academy/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FooterDesktop extends StatefulWidget {
  const FooterDesktop({Key key}) : super(key: key);

  @override
  _FooterDesktopState createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/logo.png',
                            height: 25,
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
                      kConstHeight,
                      Row(
                        children: const [
                          Icon(CupertinoIcons.location_solid, color: Colors.grey,),
                          SizedBox(width: 10,),
                          Text(
                              "Federal Capital Territory\nNigeria"),
                        ],
                      ),
                      kConstHeight2,
                      Row(
                        children: const [
                          Icon(CupertinoIcons.mail_solid, color: Colors.grey,),
                          SizedBox(width: 10,),
                          Text("Contact@breej.africa"),
                        ],
                      ),
                      kConstHeight2,
                      Row(
                        children: const [
                          Icon(CupertinoIcons.phone, color: Colors.grey,),
                          SizedBox(width: 10,),
                          Text("+234 704 310 4287"),
                        ],
                      ),
                      kConstHeight,
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: screenSize.width * .225,
                            child: TextField(
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  prefixIcon: const Icon(CupertinoIcons.mail),
                                  prefixIconColor: Colors.grey,
                                  labelText: "Email",
                                  hintText: "abc@xyz.com",
                                  labelStyle: const TextStyle(color: Colors.black54),
                                  hintStyle: TextStyle(color: lightGrey),
                                  border: const OutlineInputBorder(
                                      gapPadding: 4,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      )),
                                  focusedBorder: const OutlineInputBorder(
                                      gapPadding: 4,
                                      borderSide: BorderSide(
                                        color: Colors.black54
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      )),
                              )
                            ),
                          ),
                          Container(
                            height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: active.withOpacity(.6),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16),
                              )
                            ),
                            child: IconButton(icon: const Icon(CupertinoIcons.mail, color: Colors.white,),
                              onPressed: (){
                                print('');
                              },),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          kConstHeight,
                          Text(
                            "Courses",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
                          Text(
                            "Centers",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
                          Text(
                            "Privacy policy",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
                          Text(
                            "Terms of use",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
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
                          kConstHeight,
                          Text(
                            "Students",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
                          Text(
                            "SIWES",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
                          Text(
                            "Internship",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                          kConstHeight,
                          Text(
                            "Certificate",
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
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * .05,
                vertical: screenSize.height * .1,
              ),
              child: const Divider(
                thickness: 2,
                color: kGreyColor,
              ),
            ),
            const Text("© 2022 The Breej Global Ltd. All rights reserved"),
            kConstHeight,
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenSize.width * .2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(FontAwesomeIcons.instagram),
                  Icon(FontAwesomeIcons.linkedin),
                  Icon(FontAwesomeIcons.facebookF),
                  Icon(FontAwesomeIcons.twitter),
                  Icon(FontAwesomeIcons.youtube),
                ],),
            ),
          ],
        ));
  }
}
