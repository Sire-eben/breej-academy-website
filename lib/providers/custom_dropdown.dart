import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomWidgets with ChangeNotifier {
  final category = [
    'student',
    'Corp member',
    'Civil servant',
    'Self-employed',
    'Unemployed'
  ];
  final sex = ['Female', 'Male'];
  final skill = ['Mobile App Development'];
  final presence = ['Online', 'Physical'];

  String categoryValue;
  String sexValue;
  String skillValue;

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(),
        ),
      );

  Widget customDropDown(double width, String sexValue, String heading) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: kGreyColor)),
      child: DropdownButton<String>(
        hint: Text(heading),
        underline: DropdownButtonHideUnderline(child: Container()),
        value: sexValue,
        isExpanded: true,
        items: sex.map(buildMenuItem).toList(),
        onChanged: (sexValue) {
          this.sexValue = sexValue;
        },
      ),
    );
    notifyListeners();
  }
}
