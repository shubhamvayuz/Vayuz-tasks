import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: const Text("SQLite CRUD",style:  TextStyle(color:AppColors.appMainColor)),
      );

}
}