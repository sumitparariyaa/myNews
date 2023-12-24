import 'package:flutter/material.dart';
import 'package:mynews/screens/mainscreen.dart';
import 'package:mynews/theme.dart';

class MyNews extends StatelessWidget {
  const MyNews({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'My News',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: newsTheme.lightTheme,
      darkTheme: newsTheme.darkTheme,
      home: MainScreen(),
    );
  }
}

