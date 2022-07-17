import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BlogCardsDesktop extends StatelessWidget {
  final String image, title, location;

  const BlogCardsDesktop({Key key, this.image, this.location, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * .3,
      width: screenSize.width * .25,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: Colors.grey.shade200)
          ],
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * .25,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    AssetImage(image))),
          ),
          const SizedBox(
            height: 10,
          ),
          Text( title,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Icon(CupertinoIcons.person_alt_circle_fill, color: kGreyColor,),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Mary Dopesi",
                  style: TextStyle(
                      color: active,
                      fontSize: 13),
                )
              ],
            ),
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: kGreyColor,
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: screenSize.width * .3,
                child: Text(location,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: kGreyColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
