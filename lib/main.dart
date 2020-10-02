import 'package:e_book_library_nitw/CourseAndBooks.dart';
import 'package:e_book_library_nitw/LibrarianView.dart';
import 'package:flutter/material.dart';
import 'package:e_book_library_nitw/WelcomeScreen.dart';
import 'package:e_book_library_nitw/LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        AuthScreen.routeName: (context) => AuthScreen(),
        CourseAndBook.id: (context) => CourseAndBook(),
        LibrarianView.id: (context) => LibrarianView(),
      },
    );
  }
}
