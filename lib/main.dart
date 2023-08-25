
import 'package:apism/HomeScreens/main_home_screen.dart';
import 'package:apism/api_with_provider/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(
    ChangeNotifierProvider<HomeScreenProvider>(
      create: (context) => HomeScreenProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vayuzers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 127, 124, 131)),
        useMaterial3: true,
      ),
      home:  const MainHomeScreen(),
    );
  }
}

