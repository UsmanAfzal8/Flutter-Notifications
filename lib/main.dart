import 'package:flutter/material.dart';

import 'database/new_notification.dart';
import 'screens/first_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
       
        '/': (context) => const HomeScreen(),
        
        '/first': (context) => const FirstScreen(),
        '/second': (context) => const FirstScreen(),
      },
    );
  }
}
