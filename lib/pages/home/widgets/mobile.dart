import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breej_academy/navigation/navigation.dart';
import 'package:breej_academy/pages/footer/footer_moible.dart';
import 'package:breej_academy/pages/registration/registration_form.dart';
import 'package:breej_academy/widgets/loading_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../../widgets/courses_card.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/faqs.dart';
import '../../../widgets/get_started_button.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///===HEADER SECTION===///
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * .1,
              vertical: screenSize.width * .05,
            ),
            decoration: BoxDecoration(
              color: active,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/header.png',
                  height: screenSize.height * .65,
                ),
                Text(
                  'Your journey to becoming a',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
                // DefaultTextStyle(
                //   textAlign: TextAlign.center,
                //   style: GoogleFonts.poppins(
                //       fontSize: 35,
                //       letterSpacing: 2,
                //       fontWeight: FontWeight.w800,
                //       color: Colors.white),
                //   child: AnimatedTextKit(
                //     repeatForever: true,
                //     displayFullTextOnTap: true,
                //     animatedTexts: [
                //       TypewriterAnimatedText('Mini chat app'),
                //       TypewriterAnimatedText('Design by Sire Eben'),
                //       TypewriterAnimatedText('Talk to your loved ones'),
                //     ],
                //     onTap: () {
                //       print("Tap Event");
                //     },
                //   ),
                // ),
                Text(
                  'Certified Mobile App  ',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),

                DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    displayFullTextOnTap: true,
                    animatedTexts: [
                      TypewriterAnimatedText('Developer'),
                      TypewriterAnimatedText('Designer'),
                      TypewriterAnimatedText('Engineer'),
                    ],
                    pause: const Duration(seconds:2),
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
                ConstrainedBox(
                  constraints:
                  BoxConstraints(maxWidth: screenSize.width * .9),
                  child: const Text(
                    'begins here at the breej global academy. We provide hands-on trainings, digitised courseware, reference links, certificates and '
                        'a vibrant community of young tech stars who have gone ahead of you in your journey to '
                        'become a mobile app developer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                kConstHeight,
                InkWell(
                  onTap:() => pageNavigation(context, RegistrationForm()),
                  child: const GetStartedButton(
                    text: 'ENROL NOW',
                  ),
                ),
              ],
            ),
          ),

          ///===ADMISSIONS===///
          Container(
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal:screenSize.width * .05,
                vertical: screenSize.height * .1),
            decoration: BoxDecoration(
              color: const Color(0xFFC4C4C4).withOpacity(.3),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Image.asset(
                    'assets/images/header2.png',
                  ),
                ),
                kConstHeight,
                Text(
                  'Admission is ongoing!!!',
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: active),
                ),
                const Text(
                  "We are currently admitting students into our various campuses to learn digital skills "
                      "including product design, web development, mobile development, and digital marketing."
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                      "Velit pharetra, euismod nulla turpis maecenas viverra tempus. "
                      "Convallis sem mauris sem ac id. Lectus viverra vitae sem donec "
                      "sit pellentesque fermentum porttitor. Enim fames orci commodo in ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
                kConstHeight,
                InkWell(
                  onTap: () => pageNavigation(context, RegistrationForm()),
                  child: CustomButton(
                    text: 'Explore Now',
                    color: active,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          ///==============OUR COURSES=========///
          Container(
            color: Colors.white,
            //color: Color(0xFFC4C4C4).withOpacity(.3),
            width: screenSize.width,
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: EdgeInsets.all(screenSize.width * .1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Other Courses',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: kBlackColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                kConstHeight,
                const CoursesCard(
                  image: "assets/images/web.png",
                  header: "Web Development",
                  body:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat, ac a pharetra "
                      "adipiscing ultrices arcu. Tempor mauris odio mauris dignissim risus. Ultrices velit ut.",
                ),
                kConstHeight,
                const CoursesCard(
                  image: "assets/images/product.png",
                  header: "Product Design (UI/UX)",
                  body:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat, ac a pharetra "
                      "adipiscing ultrices arcu. Tempor mauris odio mauris dignissim risus. Ultrices velit ut.",
                ),
                kConstHeight,
                const CoursesCard(
                  image: "assets/images/mobile.png",
                  header: "Mobile App Development",
                  body:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat, ac a pharetra "
                      "adipiscing ultrices arcu. Tempor mauris odio mauris dignissim risus. Ultrices velit ut.",
                ),
                kConstHeight,
                const CoursesCard(
                  image: "assets/images/marketing.png",
                  header: "Digital Marketing",
                  body:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat, ac a pharetra "
                      "adipiscing ultrices arcu. Tempor mauris odio mauris dignissim risus. Ultrices velit ut.",
                ),
                kConstHeight,
                kConstHeight,
                kConstHeight,
                Text(
                  'Pick a track that suits you',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: active,
                  ),
                ),
                kConstHeight2,
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Id rhoncus, augue neque diam sociis ac, aliquam dolor. Nisl fermentum '
                      'ipsum sed integer faucibus ullamcorper mauris arcu erat.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
                kConstHeight,
                InkWell(
                  onTap:() => pageNavigation(context, RegistrationForm()),
                  child: const GetStartedButton(
                    text: "ENROL NOW",
                  ),
                ),
              ],
            ),
          ),

          ///===FREQUENTLY ASKED QUESTIONS===///
          Container(
            width: screenSize.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * .05),
            margin: EdgeInsets.symmetric(vertical: screenSize.height * .2),
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: kBlackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                kConstHeight,
                Container(
                  width: screenSize.width,
                  padding: EdgeInsets.all(screenSize.width * .025),
                  decoration: BoxDecoration(
                      color: const Color(0xFFEDEDED),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      border: Border.all(width: 1, color: active)
                  ),
                  child: Column(
                    children: const [
                      FAQSCard(
                        title: "How long is the training?",
                        subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id rhoncus, augue neque diam sociis ac, "
                            "aliquam dolor. Nisl fermentum ipsum sed integer faucibus ullamcorper mauris arcu erat.",
                      ),
                      FAQSCard(
                        title: "How much is the training?",
                        subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id rhoncus, augue neque diam sociis ac, "
                            "aliquam dolor. Nisl fermentum ipsum sed integer faucibus ullamcorper mauris arcu erat.",
                      ),
                      FAQSCard(
                        title: "Is the training virtual or physical?",
                        subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id rhoncus, augue neque diam sociis ac, "
                            "aliquam dolor. Nisl fermentum ipsum sed integer faucibus ullamcorper mauris arcu erat.",
                      ),
                      FAQSCard(
                        title: "Is it for beginners or exxperts?",
                        subtitle:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id rhoncus, augue neque diam sociis ac, "
                            "aliquam dolor. Nisl fermentum ipsum sed integer faucibus ullamcorper mauris arcu erat.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          ///===ENQUIRY===///
          Container(
            width: screenSize.width,
            height: screenSize.height,
            color: const Color(0xFFC4C4C4).withOpacity(.3),
            padding: EdgeInsets.all(screenSize.width * .1),
            child: Center(
              child: Container(
                height: screenSize.height * .4,
                width: screenSize.width * .8,
                decoration: BoxDecoration(
                    color: active,
                    boxShadow: const [
                      BoxShadow(blurRadius: 4, color: kGreyColor)
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Want to Make an Enquiry?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: kWhiteColor,
                      ),
                    ),
                    kConstHeight2,
                    const Text(
                      "Ask us here",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor,
                      ),
                    ),
                    kConstHeight2,
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(20)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ))),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                elevation: 6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                content: Container(
                                  width: screenSize.width * .9,
                                  padding: const EdgeInsets.all(12),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Fill the fields",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                        kConstHeight,
                                        TextFormField(
                                          controller: nameController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Field cannot be empty';
                                            }
                                            return null;
                                          },
                                          decoration:
                                          kTextInputDecoration.copyWith(
                                              labelText: 'Full name',
                                              prefixIcon: const Icon(
                                                  CupertinoIcons.person)),
                                        ),
                                        kConstHeight,
                                        TextFormField(
                                          controller: emailController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Field cannot be empty';
                                            }
                                            return null;
                                          },
                                          decoration:
                                          kTextInputDecoration.copyWith(
                                              labelText: 'Email',
                                              prefixIcon: const Icon(
                                                  CupertinoIcons.mail)),
                                        ),
                                        kConstHeight,
                                        TextFormField(
                                          textAlign: TextAlign.start,
                                          textAlignVertical:
                                          TextAlignVertical.top,
                                          minLines: 2,
                                          maxLines: 4,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Field cannot be empty';
                                            }
                                            return null;
                                          },
                                          controller: messageController,
                                          decoration:
                                          kTextInputDecoration.copyWith(
                                              labelText: 'Your message',
                                              prefixIcon: const Icon(
                                                  CupertinoIcons
                                                      .chat_bubble)),
                                        ),
                                        kConstHeight,
                                        SizedBox(
                                          width: double.infinity,
                                          height: 60,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty.all(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              12))),
                                                  elevation: MaterialStateProperty.all(0),
                                                  backgroundColor: MaterialStateProperty.all(active),
                                                  padding: MaterialStateProperty.all(const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 30,
                                                      vertical: 10))),
                                              onPressed: sendEnquiry,
                                              child:const Text(
                                                "SUBMIT",
                                                style: TextStyle(
                                                    color: kWhiteColor,
                                                    fontWeight:
                                                    FontWeight.w700),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      icon: const Icon(CupertinoIcons.mail_solid),
                      label:  Text("Make an enquiry", style: TextStyle(
                        color: active
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),

          ///===POPULAR NEWS===///
          Container(
            width: screenSize.width,
            color: Colors.white,
            padding: EdgeInsets.all(screenSize.width * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: const AssetImage("assets/images/blog.jpg"),
                  width: screenSize.width,),
                Text("Popular News",style: TextStyle(color: active, fontSize: 18, fontWeight: FontWeight.bold,),),
                kConstHeight,
                const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Praesent neque, quis adipiscing aliquet. Sodales pellentesque id "
                    "pharetra mattis purus eleifend sociis.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),


          ///===FOOTER===///
          const FooterMobile()
        ],
      ),
    );
  }

  sendEnquiry () async {
    if (_formKey.currentState.validate()) {
      showDialog(context: context, builder: (context){
        return LoadingDialog(message: "Sending Message");
      });
      await FirebaseFirestore.instance.collection("enquiries")
          .doc().set({
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "message": messageController.text.trim(),
      }).whenComplete(() {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder:
                (context) {
              return AlertDialog(
                title:
                const Text(
                  "Sent",
                  style: TextStyle(
                      fontSize:
                      14,
                      fontWeight:
                      FontWeight
                          .w700,
                      color: Colors
                          .black54),
                ),
                content:
                const Text(
                  "Message sent successfully!",
                  style: TextStyle(
                      fontSize:
                      12,
                      color: Colors
                          .black54),
                ),
                actions: [
                  TextButton(
                      onPressed: () =>
                          Navigator.pop(
                              context),
                      child:
                      const Text(
                        "Ok",
                        style: const TextStyle(
                            color: kBlackColor,
                            fontWeight: FontWeight.w700),
                      ))
                ],
              );
            });
        nameController.clear();
        emailController.clear();
        messageController.clear();
      });
    }
    else {
      return;
    }
  }
}
