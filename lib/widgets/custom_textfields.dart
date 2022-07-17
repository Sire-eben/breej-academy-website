import 'package:flutter/material.dart';

import '../constants/constants.dart';

Widget customTextField(TextEditingController controller, TextInputType type) => TextFormField(
    keyboardType: type,
    controller: controller,
    cursorColor: active,

    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Field cannot be empty';
      }
      return null;
    },
    decoration: kProfileInputDecoration);