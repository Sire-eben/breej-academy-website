import 'package:breej_academy/constants/constants.dart';
import 'package:breej_academy/pages/registration/registration_form.dart';
import 'package:breej_academy/providers/cloud_firestore.dart';
import 'package:breej_academy/widgets/custom_button.dart';
import 'package:breej_academy/widgets/custom_textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final presence = ['Virtual', 'Physical'];
  final skill = ["Mobile App Development"];

  String categoryValue;
  String sexValue;
  String skillValue;
  String presenceValue;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();


  @override
  void dispose(){
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneController.clear();
    locationController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final Uri url = Uri.parse('https://app.breej.africa');

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
                      "Student\nEnrollment\nForm",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor),
                    ),
                    Text(
                      "Fill the form below to\nenrol for the mobile app development cohort 1.0",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white),
                    ),
                    kConstHeight,
                    Text(
                      "- Become a fullstack developer.\n"
                      "- Make payments online.\n"
                      "- Online or in-person.",
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile App Development Cohort",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                        kConstHeight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: screenSize.width * .25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  formTexts("First name"), kConstHeight2, customTextField(firstNameController, TextInputType.name,),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: screenSize.width * .25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  formTexts("Last name"), kConstHeight2, customTextField(lastNameController, TextInputType.name,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        kConstHeight,
                        formTexts("Your email"), kConstHeight2, customTextField(emailController, TextInputType.emailAddress,),
                        kConstHeight,
                        formTexts("Phone no"), kConstHeight2, customTextField(phoneController, TextInputType.number,),
                        kConstHeight,
                        formTexts("Your location"), kConstHeight2, customTextField(locationController, TextInputType.text,),
                        kConstHeight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formTexts("Gender"),
                                kConstHeight2,
                                Container(
                                  width: screenSize.width * .15,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1, color: kGreyColor)),
                                  child: DropdownButton<String>(
                                    hint: const Text('Gender'),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
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
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formTexts("Category"),
                                kConstHeight2,
                                Container(
                                  width: screenSize.width * .15,
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1, color: kGreyColor)),
                                  child: DropdownButton<String>(
                                    hint: const Text('Category'),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
                                    value: categoryValue,
                                    isExpanded: true,
                                    items:
                                    category.map(buildMenuItem).toList(),
                                    onChanged: (categoryValue) {
                                      setState(() {
                                        this.categoryValue = categoryValue;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        kConstHeight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formTexts("Select Course"),
                                kConstHeight2,
                                Container(
                                  width: screenSize.width * .2,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1, color: kGreyColor)),
                                  child: DropdownButton<String>(
                                    hint: const Text('Select a course'),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
                                    value: skillValue,
                                    isExpanded: true,
                                    items: skill.map(buildMenuItem).toList(),
                                    onChanged: (skillValue) {
                                      setState(() {
                                        this.skillValue = skillValue;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formTexts("Mode"),
                                kConstHeight2,
                                Container(
                                  width: screenSize.width * .15,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          width: 1, color: kGreyColor)),
                                  child: DropdownButton<String>(
                                    hint: const Text('Online or Physical?'),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
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
                              ],
                            ),
                          ],
                        ),
                        kConstHeight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: enrolUser,
                              child: CustomButton(
                                text: 'Register',
                                color: active,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  formTexts(String text) {
    return Text(
      "$text:",
      style: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
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

  enrolUser() {

    final Uri url = Uri.parse('https://flutterwave.com/pay/breejacademy');

    if ( _formKey.currentState.validate() &&
        sexValue != null &&
        skillValue != null &&
        categoryValue != null&&
    presenceValue != null) {
      Provider.of<FirebaseOperation>(context, listen: false)
          .registerForAcademy(
        context,
        firstNameController.text.trim(),
        lastNameController.text.trim(),
        emailController.text.trim(),
        phoneController.text.trim(),
        locationController.text.trim(),
        presenceValue,
        skillValue,
        sexValue,
        categoryValue,
      ).then((value) async {
        if (!await launchUrl(url)) throw 'Could not launch $url';
      });
    } else {
      return;
    }
  }
}
