import 'package:breej_academy/constants/constants.dart';
import 'package:breej_academy/helpers/reponsiveness.dart';
import 'package:flutter/material.dart';

class FAQSCard extends StatelessWidget {
  final String title, subtitle;

  const FAQSCard({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.add,
                color: Colors.blueGrey,
                size: 30,
              ),
            ],
          ),
          kConstWidth2,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: TextStyle(
                    fontSize: ResponsiveWidget.isSmallScreen(context) ? 14 : 14,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .4),
                child: ClipRect(
                  child: Text(subtitle,
                      style: TextStyle(
                          fontSize:
                              ResponsiveWidget.isSmallScreen(context) ? 12 : 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45)),
                ),
              ),
              Padding(padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(6)
                ),
                height: 1,
                width: MediaQuery.of(context).size.width * .35,

              ),),
              kConstHeight2
            ],
          ),
        ],
      ),
    );
  }
}
