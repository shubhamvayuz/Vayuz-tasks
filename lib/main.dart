import 'package:apism/providers/home_screen_provider.dart';
import 'package:apism/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => HomeScreenProvider()))
      ],
      
      child: MaterialApp(
        title: 'Vayuzers',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 127, 124, 131)),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

