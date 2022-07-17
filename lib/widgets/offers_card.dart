import 'package:breej_academy/constants/constants.dart';
import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  final Color upperColor, lowerColor;
  final String upperText, lowerText, image;

  const OffersCard(
      {Key key,
        this.upperColor,
       this.lowerColor,
       this.upperText,
       this.lowerText,
       this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: screenSize.height * .06,
            width: screenSize.width * .2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(6, 4),
                      color: Colors.grey.shade200,
                      blurRadius: 10)
                ],
                color: upperColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                )),
            child: Align(
                alignment: Alignment.center,
                child: Text(upperText,
                    style: const TextStyle(
                      color: kWhiteColor,
                        fontSize: 16, fontWeight: FontWeight.bold))),
          ),
          Container(
            height: screenSize.height * .3,
            width: screenSize.width * .2,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10)
                ],
                color: lowerColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                )),
            child: Stack(children: [
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: screenSize.height * .15,
                    width: screenSize.width * .15,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(36)),
                        image: DecorationImage(image: AssetImage(image))),
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  lowerText,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
