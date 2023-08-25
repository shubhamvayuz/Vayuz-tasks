import 'package:flutter/material.dart';

class MyTextFieldWidgets extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool validate;

  const MyTextFieldWidgets({required this.hintText,required this.labelText,required this.controller,required this.validate,super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: hintText,
                    labelText: labelText,
                    errorText:
                        validate ? '$labelText Value Can\'t Be Empty' : null,
                  ));
  }
}
