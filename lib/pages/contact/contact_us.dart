import 'package:breej_academy/pages/contact/widgets/desktop.dart';
import 'package:breej_academy/pages/contact/widgets/mobile.dart';
import 'package:breej_academy/widgets/drawer.dart';
import 'package:breej_academy/widgets/navbar_mobile.dart';
import 'package:flutter/material.dart';

import '../../helpers/reponsiveness.dart';
import '../../widgets/navbar_desktop.dart';

class ContactUsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  ContactUsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context) ?
      mobileNavBar(context, scaffoldKey) :
      PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: const NavBar(),
      ),
      endDrawer: SideMenu(key: key,),
      backgroundColor: Colors.white,
      body: const ResponsiveWidget(
        largeScreen: DesktopScreen(),
        smallScreen: MobileScreen(),
      ),
    );
  }
}
