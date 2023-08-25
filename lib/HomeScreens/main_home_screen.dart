import 'package:apism/CrudWithModel/screens/home_screen.dart';
import 'package:apism/Utils/widgets/app_colors.dart';
import 'package:apism/Utils/widgets/container_widget.dart';
import 'package:apism/api_with_provider/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: AppColors.appMainColor,
        title:const  Text("Main Home Screen",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: ((context) => const HomeScreen()
                    )
                ));
              }, 
              child: const MyContainerWidget(text: "API with Provider"),
              ),
            TextButton(
              onPressed: (){
                 Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: ((context) => const CrudHomeScreen()
                    )
                ));
              }, 
              child: const MyContainerWidget(text: "CRUD Operation"),
              ),
      
          ]),
      ),
    );
  }
}