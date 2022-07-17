import 'package:breej_academy/helpers/reponsiveness.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class StepsCard extends StatelessWidget {
  final String image, header, body;
  final IconData icon;
  final Color iconColor, boxColor;

  const StepsCard({Key key, this.image, this.header, this.body, this.iconColor, this.boxColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: ResponsiveWidget.isSmallScreen(context)
                  ? screenSize.width * .85
                  : screenSize.width * .25),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          margin: ResponsiveWidget.isSmallScreen(context)
              ? EdgeInsets.only(top: 30)
              : EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
              color: boxColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              // boxShadow: [
              //   BoxShadow(color: kGreyColor.withOpacity(.2), blurRadius: 5)
              // ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: screenSize.height * .1,
                  width: screenSize.height * .1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: iconColor,
                  ),
                  child: Icon(icon,size: 30, color: kWhiteColor, )),
              kConstHeight,
              Text(
                header,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                body,
                style: TextStyle(fontSize: 12,
                  color: Colors.black54,),
              )
            ],
          ),
        ),

        Positioned(
            top: -10,
            right: 40,
            child: Image.asset(image))
      ],
    );
  }
}
