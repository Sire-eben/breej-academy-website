import 'package:breej_academy/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final List _isHovering = [
    false,
    false,
    false,
    false,
  ];
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
    Size screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * .2,
              bottom: screenSize.height * .05,
            ),
            child: Column(
              children: [
                Text(
                  "Contact Us",
                  style: GoogleFonts.poppins(
                      fontSize: 18, color: active, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Get In Touch",
                  style: GoogleFonts.poppins(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Fill up the form and we will get back to you within 24 hours.\n"
                  "You can also reach out to us via email, phone or our social media.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.85),
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //=========== CONTACT SECTION ==================
              Container(
                padding: EdgeInsets.only(
                  bottom: screenSize.width * .1,
                ),
                width: screenSize.width * .35,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: kTextInputDecoration.copyWith(
                            labelText: 'First name'),
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
                            kTextInputDecoration.copyWith(labelText: 'Email', prefixIcon: Icon(CupertinoIcons.mail)),
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
                        decoration: kTextInputDecoration.copyWith(
                            labelText: 'Your message', prefixIcon: Icon(CupertinoIcons.mail_solid)),
                      ),
                      kConstHeight,
                      SizedBox(
                        height: screenSize.height * .08,
                        width: screenSize.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(active)),
                          onPressed: () {
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
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        title: const Text('Success!'),
                                        content: const Text("Message sent successfully."),
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
                            }else{return;}
                          },
                          child: isLoading == true ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('Submitting...')
                            ],
                          ) : const Text(
                            'Submit message',
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
                padding: EdgeInsets.only(
                  bottom: screenSize.width * .1,
                ),
                width: screenSize.width * .35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.mail,
                            color: active,
                          ),
                          const SizedBox(width: 15,),
                          const Text("contact@breej.africa")
                        ],
                      ),
                    ),

                    const SizedBox(height: 30,),

                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.phone,
                            color: active,
                          ),
                          const SizedBox(width: 15,),
                          const Text("08022015752")
                        ],
                      ),
                    ),

                    const SizedBox(height: 30,),
                    Text(
                      "Socials",
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[0] = true
                                  : _isHovering[0] = false;
                            });
                          },
                          hoverColor: Colors.transparent,
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
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                  visible: _isHovering[0],
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  child: Container(
                                    height: 3,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: active,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ))
                            ],
                          ),
                        ),

                        const SizedBox(width: 15,),
                        const Text("Instagram")
                      ],
                    ),
                    SizedBox(width: screenSize.width / 40),
                    Row(
                      children: [
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[1] = true
                                  : _isHovering[1] = false;
                            });
                          },
                          hoverColor: Colors.transparent,
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
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                  visible: _isHovering[1],
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  child: Container(
                                    height: 3,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: active,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(width: 15,),
                        const Text("Linkedin")
                      ],
                    ),
                    SizedBox(width: screenSize.width / 40),
                    Row(
                      children: [
                        InkWell(
                          onHover: (value) {
                            setState(() {
                              value
                                  ? _isHovering[2] = true
                                  : _isHovering[2] = false;
                            });
                          },
                          hoverColor: Colors.transparent,
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
                              const SizedBox(
                                height: 5,
                              ),
                              Visibility(
                                  visible: _isHovering[2],
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  child: Container(
                                    height: 3,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: active,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(width: 15,),
                        const Text("Facebook")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
