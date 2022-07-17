import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


final Uri _url = Uri.parse('https://flutter.dev');

const mainParagraph =
    "Access to accredited tutors, academic materials and SIWES placements. All in one app. Join the breej now!";
const aboutParagraph =
    "we provide access to accredited tutors, academic materials and SIWES placements. All in one app. Join the breej now!";

const publicKey = "FLWPUBK-d73b1078701eb0b31671456c0a0c4980-X";
const encryptionKey = "9d8661bb336939598f8e2dd1";

final kTextInputDecoration = InputDecoration(
  floatingLabelStyle: TextStyle(color: active, fontWeight: FontWeight.bold),
  focusColor: active,
  hoverColor: active,
  prefixIcon: const Icon(CupertinoIcons.person),
  prefixIconColor: active,
  labelText: "Full name",
  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(
      color: active, width: 1
    )
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    // borderSide: BorderSide(
    //   color: active, width: 1
    // )
  )
);

const kInputTextStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, );

const kBlackColor = Color(0xFF000000);
const kSecondaryColor = Color(0xFF0A0451);
const kWhiteColor = Color(0xFFFFFFFF);
const kGreyColor = Color(0xFF9D9898);
const kRedColor = Color(0xFFF0635A);
const kOrangeColor = Color(0xFFF59762);
const kGreenColor = Color(0xFF29D697);
const kBlueColor = Color(0xFF46CDFB);
const kConstHeight = SizedBox(height: 20,);
const kConstHeight2 = SizedBox(height: 10,);
const kConstWidth = SizedBox(width: 20,);
const kConstWidth2 = SizedBox(width: 10,);

Color light = const Color(0xFFF7F8FC);
Color lightGrey = const Color(0xFFA4A6B3);
Color dark = const Color(0xFF363740);
Color active = const Color(0xFF0A0451);
Color disable = const Color(0xFF000000).withOpacity(.8);

final kInputDecoration = InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    prefixIcon: const Icon(Icons.person),
    labelText: "Label text",
    hintText: "Hint text",
    labelStyle: TextStyle(color: active),
    hintStyle: TextStyle(color: lightGrey),
    border: OutlineInputBorder(
        gapPadding: 4,
        borderRadius: BorderRadius.circular(16))
);

final kProfileInputDecoration = InputDecoration(

  fillColor: Colors.white,
    floatingLabelStyle: TextStyle(color: active, fontWeight: FontWeight.bold),
    focusColor: Colors.grey,
    hoverColor: active,
    labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
            color: active, width: 1
        )
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      // borderSide: BorderSide(
      //   color: active, width: 1
      // )
    )
);