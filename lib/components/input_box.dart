import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool? isPass;
  final bool? isFill;
  final String? value;
  const InputBox(
      {super.key,
      required this.placeholder,
      this.controller,
      this.isPass,
      this.isFill, this.value});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPass == true ? true : false,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: isFill,
        fillColor: isFill == true ? Colors.white : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: placeholder,
      ),
    );
  }
}
