import 'package:breej_academy/constants/constants.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final String name, position, imageUrl;

  const TeamCard({Key key, this.name, this.position, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundColor: active,
          backgroundImage: AssetImage(imageUrl),),
        kConstHeight,
        Text(name, style: const TextStyle(fontWeight: FontWeight.w900, color: kBlackColor,
            fontSize: 16),),
        kConstHeight2,
        Text(position, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54,
            fontSize: 13),),
      ],
    );
  }
}
