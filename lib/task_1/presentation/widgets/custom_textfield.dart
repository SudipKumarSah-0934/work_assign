import 'package:flutter/material.dart';

class CustomTextField extends TextField {
  CustomTextField({
    Key? key,
    TextEditingController? controller,
    TextStyle? style,
    String? hintText,
  }) : super(
          key: key,
          controller: controller,
          style: style,
          decoration: InputDecoration(
            hintText: "enter your url",
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0,color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
}
