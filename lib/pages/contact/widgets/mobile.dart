import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';

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
  void dispose(){
    // Add code before the super
    nameController.clear();
    emailController.clear();
    messageController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //=========== CONTACT SECTION ==================
          Container(
            padding: EdgeInsets.all(screenSize.width * .05),
            margin: EdgeInsets.only(top: screenSize.height * .15),
            width: screenSize.width,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Contact Us",
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: active,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Get In Touch",
                    style: GoogleFonts.poppins(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Fill up the form and we will get back to you within 24 hours.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration:
                        kTextInputDecoration.copyWith(labelText: 'First name'),
                  ),
                  kConstHeight,
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                    controller: emailController,
                    decoration:
                        kTextInputDecoration.copyWith(labelText: 'Email',prefixIcon: Icon(CupertinoIcons.mail)),
                  ),
                  kConstHeight,
                  TextFormField(
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    controller: messageController,
                    decoration:
                        kTextInputDecoration.copyWith(labelText: 'Your message', prefixIcon: Icon(CupertinoIcons.mail_solid)),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: screenSize.height * .08,
                    width: screenSize.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                          backgroundColor: MaterialStateProperty.all(active)),
                      onPressed: isLoading ? null : () {
                        //SUBMIT DATA
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          //Update to server
                          FirebaseFirestore.instance
                              .collection('Contact form')
                              .doc(DateTime.now().microsecondsSinceEpoch.toString())
                              .set({
                            "name": nameController.text.trim(),
                            "email": emailController.text.trim(),
                            "message": messageController.text.trim(),
                            'time': DateTime.now()
                          }).whenComplete(() {
                            setState(() {
                              isLoading = false;
                            });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      elevation: 10,
                                    title: const Text('Success!'),
                                      content: const Text("Form submitted successfully."),
                                    actions: [
                                      TextButton(onPressed: (){

                                        Navigator.pop(context);
                                      }, child: const Text('Ok'))
                                    ],
                                  );
                                });
                            nameController.clear();
                            emailController.clear();
                            messageController.clear();
                          });
                        }
                      },
                      child:  isLoading == true ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(color: Colors.white,),
                          SizedBox(width: 10,),
                          Text('Submitting...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ) : const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              screenSize.width * .2,
              0,
              screenSize.width * .2,
              screenSize.width * .2,
            ),
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You can also reach out to us via email, phone or our social media.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail,
                        color: active,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("contact@breej.africa")
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: active,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("07043104287")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Socials",
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Image.asset(
                            "assets/images/instagram.png",
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Image.asset(
                            "assets/images/linkedin.png",
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenSize.width / 40),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Image.asset(
                            "assets/images/facebook.png",
                            height: 25,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
