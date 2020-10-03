import 'package:e_book_library_nitw/CourseAndBooks.dart';
import 'package:e_book_library_nitw/EditCourseData.dart';
import 'package:e_book_library_nitw/LibrarianView.dart';
import 'package:flutter/material.dart';
import 'package:e_book_library_nitw/WelcomeScreen.dart';
import 'package:e_book_library_nitw/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:e_book_library_nitw/auth.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: Edit(),
        )
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: WelcomeScreen.id,
          routes: {
            WelcomeScreen.id: (context) => WelcomeScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
            CourseAndBook.id: (context) => CourseAndBook(),
            LibrarianView.id: (context) => LibrarianView(),
          },
        ),
      ),
    );
  }
}
