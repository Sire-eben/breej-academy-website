import 'package:breej_academy/constants/constants.dart';
import 'package:breej_academy/pages/registration/registration_form.dart';
import 'package:breej_academy/widgets/custom_textfields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/cloud_firestore.dart';
import '../../../widgets/custom_button.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({Key key}) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  final _formKey = GlobalKey<FormState>();
  final category = [
    'student',
    'Corp member',
    'Civil servant',
    'Self-employed',
    'Unemployed'
  ];
  final sex = ['Female', 'Male'];
  final skill = ['Mobile App Development'];
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
  TextEditingController locationController = TextEditingController();

  // String _paymentRef;
  //
  // void setPaymentRef() {
  //   int randomRef = Random().nextInt(200000000);
  //
  //   setState(() {
  //     _paymentRef = "Payment$randomRef";
  //   });
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setPaymentRef();
  // }

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
    var screenSize = MediaQuery
        .of(context)
        .size;

    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: screenSize.width,
          padding: const EdgeInsets.only(left: 20, right: 20),
          margin: const EdgeInsets.only(bottom: 50),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      Text(
                        "Student Enrollment Form",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: active),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Fill the form below to join in the next session",
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('First name'),
                    customTextField(firstNameController, TextInputType.name),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Last name'),
                    customTextField(lastNameController, TextInputType.name),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Email'),
                    customTextField(emailController, TextInputType.emailAddress),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Phone no'),
                    customTextField(phoneController, TextInputType.number),
                  ],
                ),

                ///===SEX===///
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Gender'),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1, color: kGreyColor,
                        )
                      ),
                      child: DropdownButton<String>(
                        underline: DropdownButtonHideUnderline(child: SizedBox.shrink(),),
                        hint: const Text('Gender'),
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

                ///===CATEGORY===///
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Category'),
              Container(
                width: screenSize.width,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: 1, color: kGreyColor,
                    )
                ),
                child: DropdownButton<String>(
                  underline: DropdownButtonHideUnderline(child: SizedBox.shrink(),),
                      hint: const Text('Category'),
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Mode'),
                    Container(
                      width: screenSize.width,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1, color: kGreyColor,
                          )
                      ),
                      child: DropdownButton<String>(
                        underline: DropdownButtonHideUnderline(child: SizedBox.shrink(),),
                      hint: const Text('Online or physical tutorials?'),
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

                ///===LOCATION===///
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts('Location'),
                    customTextField(locationController, TextInputType.text),
                  ],
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    formTexts("Select Course"),
                    kConstHeight2,
                    Container(
                      width: screenSize.width,
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

                const SizedBox(
                  height: 10,
                ),

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
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(),
        ),
      );

  formTexts(String text) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
        "$text:",
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
  );

  enrolUser() {

    final Uri url = Uri.parse('https://flutterwave.com/pay/breejacademy');

    if ( _formKey.currentState.validate() &&
        sexValue != null &&
        skillValue != null &&
        categoryValue != null &&
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

// void makePayment(BuildContext context, String _email, String _firstName,
//     String _lastName, String _phone) async {
//   try {
//     Flutterwave flutterwave = Flutterwave.forUIPayment(
//         context: this.context,
//         encryptionKey: encryptionKey,
//         publicKey: publicKey,
//         currency: "NGN",
//         amount: "10000",
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
//     final ChargeResponse response =
//         await flutterwave.initializeForUiPayments();
//     if (response.message == null) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return const AlertDialog(
//               content: Text("Transaction failed!"),
//             );
//           });
//     } else {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text(response.message),
//             );
//           });
//     }
//   } catch (error) {
//     print(error);
//   }
// }
}
