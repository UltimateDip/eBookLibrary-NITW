import 'package:e_book_library_nitw/CNB.dart';
import 'package:flutter/material.dart';

class Edit with ChangeNotifier {
  List<Course> _course = [
    Course(
      id: 'C1',
      courseName: 'C1',
      imageUrl:
          'https://drive.google.com/file/d/1y7L8sDtt7AppWHxDPKcn6-oi0lTer-sA/view?usp=sharing',
      courseDetails: 'Details about course C1 will be here',
    ),
    Course(
      id: 'C2',
      courseName: 'C2',
      imageUrl:
          'https://drive.google.com/file/d/1E-wpefZB1bh-I2f9vQPdXCZy31jf_QK8/view?usp=sharing',
      courseDetails: 'Details about course C2 will be here',
    ),
    Course(
      id: 'C3',
      courseName: 'C3',
      imageUrl:
          'https://drive.google.com/file/d/1BYRuu-ShHrlVdrUbQtULCt96B75y4RKZ/view?usp=sharing',
      courseDetails: 'Details about course C3 will be here',
    ),
    Course(
      id: 'C4',
      courseName: 'C4',
      imageUrl:
          'https://drive.google.com/file/d/13wcuIleYTYWKzByZp51bCKQZ5ch2GLIE/view?usp=sharing',
      courseDetails: 'Details about course C4 will be here',
    ),
  ];
  List<Book> _book = [
    Book(
      id: 'B1',
      bookName: 'B1',
      imageUrl:
          'https://drive.google.com/file/d/1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y/view?usp=sharing',
      bookDetails: 'Details about book B1 will be here',
    ),
    Book(
      id: 'B2',
      bookName: 'B2',
      imageUrl:
          'https://drive.google.com/file/d/1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y/view?usp=sharing',
      bookDetails: 'Details about book B2 will be here',
    ),
    Book(
      id: 'B3',
      bookName: 'B3',
      imageUrl:
          'https://drive.google.com/file/d/1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y/view?usp=sharing',
      bookDetails: 'Details about book B3 will be here',
    ),
    Book(
      id: 'B4',
      bookName: 'B4',
      imageUrl:
          'https://drive.google.com/file/d/1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y/view?usp=sharing',
      bookDetails: 'Details about book B4 will be here',
    ),
  ];

  List<Course> get course {
    return [..._course];
  }

  List<Book> get book {
    return [..._book];
  }

  void addCourse() {
    // _course.add(value);
    notifyListeners();
  }

  void addBook() {
    // _book.add(value);
    notifyListeners();
  }
}
