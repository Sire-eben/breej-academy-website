import 'package:breej_academy/pages/home/home.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';


Widget mobileNavBar( BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
  iconTheme: const IconThemeData(
    color: Colors.white
  ),
      backgroundColor: active,
      title: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Image.asset('assets/icons/white logo.png', height: 30,)),
      centerTitle: true,
      elevation: 0,
    );
