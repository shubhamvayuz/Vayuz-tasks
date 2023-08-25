import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class MyContainerWidget extends StatelessWidget {
  final String text;
  const MyContainerWidget({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      width: double.infinity,
      padding : const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      margin:  const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration:const   BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius:  BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(child: Text(text,style: const TextStyle(color: Colors.white),)),
    );
  }
}