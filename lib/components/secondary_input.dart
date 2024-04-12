import 'package:flutter/material.dart';

class SecondaryInputBox extends StatelessWidget {
  final String placeholder;
  final bool isIcon;
  final TextEditingController? controller;
  const SecondaryInputBox(
      {super.key,
      required this.placeholder,
      required this.isIcon,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        prefixIcon:
            isIcon ? Icon(Icons.location_on, color: Color(0xffd39b40)) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xffd39b40), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xffd39b40), width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xffd39b40), width: 1.5),
        ),
        hintText: placeholder,
        hintStyle: TextStyle(color: Color(0xffd39b40)),
      ),
    );
  }
}
