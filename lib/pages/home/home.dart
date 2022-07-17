
import 'package:breej_academy/pages/home/widgets/desktop.dart';
import 'package:breej_academy/pages/home/widgets/mobile.dart';
import 'package:flutter/material.dart';

import '../../helpers/reponsiveness.dart';
import '../../widgets/drawer.dart';
import '../../widgets/navbar_desktop.dart';
import '../../widgets/navbar_mobile.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      key: scaffoldKey,
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
