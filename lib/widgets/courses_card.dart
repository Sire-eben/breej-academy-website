import 'package:breej_academy/helpers/reponsiveness.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

class CoursesCard extends StatelessWidget {
  final String image, header, body;

  const CoursesCard({Key key, this.image, this.header, this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
          maxWidth: ResponsiveWidget.isSmallScreen(context)
              ? screenSize.width * .85
              : screenSize.width * .25),
      padding: const EdgeInsets.all(30),
      margin: ResponsiveWidget.isSmallScreen(context)
          ? const EdgeInsets.only(top: 30)
          : const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(22),
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
            //topLeft: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: kGreyColor.withOpacity(.2), blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveWidget.isSmallScreen(context)
              ? Image.asset(
                  image,
                  height: screenSize.height * .2,
                )
              : Lottie.asset(
                  image,
                  height: screenSize.height * .2,
                ),
          kConstHeight,
          Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            body,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
