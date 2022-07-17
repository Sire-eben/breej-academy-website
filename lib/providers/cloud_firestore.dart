import 'package:breej_academy/pages/registration/registration_form.dart';
import 'package:breej_academy/widgets/loading_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseOperation with ChangeNotifier {
  Future<void> registerForAcademy(
      BuildContext context,
      String firstName,
      String lastName,
      String email,
      String phone,
      String location,
      String presence,
      String skill,
      String sex,
      String category) async {
    showDialog(
        context: context,
        builder: (context) {
          return const LoadingDialog(message: "Redirecting to payment page");
        });
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: phone)
        .then((auth) {
      FirebaseFirestore.instance.collection("gwagwalada").doc(auth.user.uid).set({
        "first name": firstName,
        "last name": lastName,
        "email": email,
        "phone": phone,
        "location": location,
        "presence": presence,
        "sex": sex,
        "skill": skill,
        "category": category,
      });
    }).whenComplete(() {
      Navigator.pop(context);

      // showDialog(
      //     context: context,
      //     builder: (_) => AlertDialog(
      //       title: const Text(
      //           "Registration was successful!"),
      //       actions: [
      //         TextButton(onPressed: (){
      //           Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => RegistrationForm()));
      //         }, child: Text("Ok"))
      //       ],
      //     ));
    });
    notifyListeners();
  }

}
