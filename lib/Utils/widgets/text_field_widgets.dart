import 'package:apism/Utils/widgets/app_colors.dart';
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
      scribbleEnabled: false,
      style: const TextStyle(color: AppColors.appMainColor),
      cursorColor: AppColors.appMainColor,
      controller: controller,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: AppColors.appMainColor),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
          color: AppColors.appMainColor
          )
        ),
        hintText: hintText,
        labelText: labelText,
        hintStyle:const  TextStyle(color: AppColors.appMainColor),
        errorText:
            validate ? '$labelText Value Can\'t Be Empty' : null,
      ));
  }
}
