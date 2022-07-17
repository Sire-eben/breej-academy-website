import 'package:breej_academy/constants/constants.dart';
import 'package:breej_academy/pages/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final _formKey = GlobalKey<FormState>();
  final category = [
    'student',
    'Corp member',
    'Civil servant',
    'Self-employed',
    'Unemployed'
  ];
  final sex = ['Female', 'Male'];
  final skill = ['No', 'Yes'];
  final presence = ['Online', 'Physical'];

  String categoryValue;
  String sexValue;
  String skillValue;
  String presenceValue;
  bool isLoading = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController expectationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: screenSize.width,
          height: screenSize.height * .9,
          margin: EdgeInsets.only(top: screenSize.height * .1),
          child: Row(
            children: [
              Container(
                width: screenSize.width * .3,
                height: screenSize.height,
                padding: EdgeInsets.all(screenSize.width * .05),
                decoration: BoxDecoration(color: active),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tutor\nEnrollment\nForm",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor),
                    ),
                    Text(
                      "Fill the form below to\nsign up as a tutor on the breej",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white),
                    ),
                    kConstHeight,
                    Text(
                      "- Schedule tutorials.\n"
                      "- Receive payments online.\n"
                      "- Online or in-person."
                      "- Earn on the go.",
                      style: GoogleFonts.poppins(
                          fontSize: 12, color: Colors.white54),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenSize.width * .65,
                height: screenSize.height,
                padding: EdgeInsets.all(screenSize.width * .05),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: screenSize.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width * .25,
                              child: TextFormField(
                                style: TextStyle(color: kBlackColor),
                                autofocus: true,
                                cursorColor: active,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                                controller: firstNameController,
                                decoration: kTextInputDecoration.copyWith(
                                  labelText: 'First name',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * .25,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                                controller: lastNameController,
                                decoration: kTextInputDecoration.copyWith(
                                    labelText: 'Last name'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: screenSize.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width * .25,
                              child:
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                decoration: kTextInputDecoration.copyWith(
                                    labelText: 'Email',
                                    prefixIcon: Icon(CupertinoIcons.mail)),
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * .25,
                              child:
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                                controller: phoneController,
                                decoration: kTextInputDecoration.copyWith(
                                    labelText: 'Phone number',
                                    prefixIcon: Icon(CupertinoIcons.phone)),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: screenSize.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenSize.width * .25,
                              padding: EdgeInsets.symmetric(horizontal: 12,),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1, color: kGreyColor)
                              ),
                              child: DropdownButton<String>(
                                hint: const Text('Gender'),
                                underline: DropdownButtonHideUnderline(child: Container()),
                                value: sexValue,
                                isExpanded: true,
                                items: sex.map(buildMenuItem).toList(),
                                onChanged: (sexValue) {
                                  setState(() {
                                    this.sexValue = sexValue;
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: screenSize.width * .25,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1, color: kGreyColor)
                              ),
                              child:

                                  ///===CATEGORY===///
                                  DropdownButton<String>(
                                hint: const Text('Category'),
                                    underline: DropdownButtonHideUnderline(child: Container()),
                                value: categoryValue,
                                isExpanded: true,
                                items: category.map(buildMenuItem).toList(),
                                onChanged: (categoryValue) {
                                  setState(() {
                                    this.categoryValue = categoryValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: screenSize.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenSize.width * .25,
                              padding: EdgeInsets.symmetric(horizontal: 12,),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1, color: kGreyColor)
                              ),
                              child: DropdownButton<String>(
                                hint: const Text('Online or in-person?'),
                                underline: DropdownButtonHideUnderline(child: Container()),
                                value: presenceValue,
                                isExpanded: true,
                                items: presence.map(buildMenuItem).toList(),
                                onChanged: (presenceValue) {
                                  setState(() {
                                    this.presenceValue = presenceValue;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * .25,
                              child:

                                  ///===LOCATION===///
                                  TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Field cannot be empty';
                                  }
                                  return null;
                                },
                                controller: locationController,
                                decoration: kTextInputDecoration.copyWith(
                                    labelText: 'Your location (state)',
                                    prefixIcon: Icon(CupertinoIcons.location)),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ///===SKILL===///
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field cannot be empty';
                          }
                          return null;
                        },
                        controller: skillController,
                        decoration: kTextInputDecoration.copyWith(
                            labelText: 'What skill(s) do you want to tutor?',
                            prefixIcon: Icon(CupertinoIcons.skew)),
                      ),

                      kConstHeight2,

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
                          onPressed: isLoading
                              ? null
                              : () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  //SUBMIT DATA
                                  if (_formKey.currentState.validate() &&
                                      sexValue != null &&
                                      categoryValue != null &&
                                      presenceValue != null) {
                                    //Update to server
                                    FirebaseFirestore.instance
                                        .collection('tutor wait list')
                                        .doc(emailController.text.trim())
                                        .set({
                                      "first name":
                                          firstNameController.text.trim(),
                                      "last name":
                                          lastNameController.text.trim(),
                                      "email": emailController.text.trim(),
                                      "phone": phoneController.text.trim(),
                                      "gender": sexValue,
                                      "category": categoryValue,
                                      "presence": presenceValue,
                                      "skill": skillController.text.trim(),
                                      "location":
                                          locationController.text.trim(),
                                      'time': DateTime.now()
                                    }).whenComplete(() {
                                      setState(() {
                                        isLoading = false;
                                      });
                                      firstNameController.clear();
                                      lastNameController.clear();
                                      emailController.clear();
                                      phoneController.clear();
                                      skillController.clear();
                                      locationController.clear();
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              content: SizedBox(
                                                width: screenSize.width * .6,
                                                height: screenSize.width * .75,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Lottie.asset(
                                                      'assets/animations/success.json',
                                                      height:
                                                          screenSize.height *
                                                              .2,
                                                    ),
                                                    const Text(
                                                      'Application successful!!',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    ConstrainedBox(
                                                      constraints: BoxConstraints(
                                                          maxWidth:
                                                              screenSize.width *
                                                                  .9),
                                                      child: const Text(
                                                        'Your information was submitted successfully.'
                                                        '\nYou will receive a mail shortly',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 15),
                                                      height:
                                                          screenSize.height *
                                                              .08,
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  primary:
                                                                      active),
                                                          onPressed: () {
                                                            Navigator.pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            HomePage()),
                                                                (route) =>
                                                                    false);
                                                          },
                                                          child: const Text(
                                                            "Learn more",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    });
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Empty Fields!'),
                                            content: const Text(
                                                'Please, make sure you fill the form correctly'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Ok',
                                                    style: TextStyle(
                                                        color: active),
                                                  ))
                                            ],
                                          );
                                        });
                                  }
                                },
                          child: isLoading == true
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Submitting...',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              : const Text(
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
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(),
        ),
      );

// void makePayment(BuildContext context, String _email, String _firstName, String _lastName, String _phone) async{
//   try {
//     Flutterwave flutterwave = Flutterwave.forUIPayment(
//         context: this.context,
//         encryptionKey: encryptionKey,
//         publicKey: publicKey,
//         currency: "NGN",
//         amount: "10,000",
//         email: _email,
//         fullName: _firstName + _lastName,
//         txRef: _paymentRef,
//         isDebugMode: false,
//         phoneNumber: _phone,
//         acceptCardPayment: true,
//         acceptUSSDPayment: true,
//         acceptAccountPayment: true,
//         acceptFrancophoneMobileMoney: false,
//         acceptGhanaPayment: false,
//         acceptMpesaPayment: false,
//         acceptRwandaMoneyPayment: true,
//         acceptUgandaPayment: false,
//         acceptZambiaPayment: false);
//
//     final ChargeResponse response = await flutterwave.initializeForUiPayments();
//     if(response.message == null){
//       showDialog(context: context, builder: (context){
//         return const AlertDialog(
//           content: Text("Transaction failed!"),
//         );
//       });
//     } else{
//       showDialog(context: context, builder: (context){
//         return AlertDialog(
//           content: Text(response.message),
//         );
//       });
//     }
//
//   } catch(error) {
//     print(error);
//   }
// }
}
