import 'package:flutter/material.dart';

class CommunityDesktop extends StatefulWidget {
  const CommunityDesktop({Key key}) : super(key: key);

  @override
  State<CommunityDesktop> createState() => _CommunityDesktopState();
}

class _CommunityDesktopState extends State<CommunityDesktop> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Center(
        child: Text("Community"),
      ),
    );
  }
}
