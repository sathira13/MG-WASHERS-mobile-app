import 'package:flutter/material.dart';

class IconInputBox extends StatelessWidget {
  const IconInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText:
            "What are you looking for?", hintStyle: TextStyle(color: Color(0xff929292)), // Replace "placeholder" with your variable if needed
        prefixIcon: Icon(
            Icons.search), // Example: Adding a person icon as the leading icon
      ),
    );
  }
}
