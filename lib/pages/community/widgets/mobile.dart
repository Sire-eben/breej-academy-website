import 'package:flutter/material.dart';

class CommunityMobile extends StatefulWidget {
  const CommunityMobile({Key key}) : super(key: key);

  @override
  State<CommunityMobile> createState() => _CommunityMobileState();
}

class _CommunityMobileState extends State<CommunityMobile> {

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return const SingleChildScrollView(
      child: Center(
        child: Text("Community"),
      ),
    );
  }
}
