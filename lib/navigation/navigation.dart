import 'package:flutter/cupertino.dart';

 pageNavigation(BuildContext context, Widget nextPage){
  Navigator.push(context, CupertinoPageRoute(builder: (context) => nextPage));
}