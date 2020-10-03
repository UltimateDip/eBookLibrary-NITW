import 'package:e_book_library_nitw/CNB.dart';
import 'package:flutter/material.dart';

class Edit with ChangeNotifier {
  List<Course> _course = [
    Course(
      id: 'C1',
      courseName: 'C1',
      imageUrl:
          'https://drive.google.com/uc?export=view&id=1y7L8sDtt7AppWHxDPKcn6-oi0lTer-sA',
      courseDetails: 'Details about course C1 will be here',
    ),
    Course(
      id: 'C2',
      courseName: 'C2',
      imageUrl:
          'https://drive.google.com/uc?export=view&id=1E-wpefZB1bh-I2f9vQPdXCZy31jf_QK8',
      courseDetails: 'Details about course C2 will be here',
    ),
    Course(
      id: 'C3',
      courseName: 'C3',
      imageUrl:
      'https://drive.google.com/uc?export=view&id=1BYRuu-ShHrlVdrUbQtULCt96B75y4RKZ',
      courseDetails: 'Details about course C3 will be here',
    ),
    Course(
      id: 'C4',
      courseName: 'C4',
      imageUrl:
      'https://drive.google.com/uc?export=view&id=13wcuIleYTYWKzByZp51bCKQZ5ch2GLIE',
      courseDetails: 'Details about course C4 will be here',
    ),
  ];
  List<Book> _book = [
    Book(
      id: 'B1',
      bookName: 'B1',
      imageUrl:
      'https://drive.google.com/uc?export=view&id=1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y',
      bookDetails: 'Details about book B1 will be here',
    ),
    Book(
      id: 'B2',
      bookName: 'B2',
      imageUrl:
      'https://drive.google.com/uc?export=view&id=1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y',
      bookDetails: 'Details about book B2 will be here',
    ),
    Book(
      id: 'B3',
      bookName: 'B3',
      imageUrl:
      'https://drive.google.com/uc?export=view&id=1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y',
      bookDetails: 'Details about book B3 will be here',
    ),
    Book(
      id: 'B4',
      bookName: 'B4',
      imageUrl:
      'https://drive.google.com/uc?export=view&id=1l0fTzX_xDpfw7pcMy-4t2KxuOeYo0J0y',
      bookDetails: 'Details about book B4 will be here',
    ),
  ];

  List<Course> get course {
    return [..._course];
  }

  List<Book> get book {
    return [..._book];
  }

  void removeCourse(String id) {
    int i = int.parse(id.substring(1));

    _course.removeAt(i - 1);
  }

  void removeBook(String id) {
    int i = int.parse(id.substring(1));

    _book.removeAt(i - 1);
  }

  void addCourse(String id,
      String courseName,
      String imageUrl,
      String courseDetails,) {
    _course.add(Course(
        id: id,
        courseName: courseName,
        imageUrl: imageUrl,
        courseDetails: courseDetails));
    notifyListeners();
    print(_course.length);
    // print(Edit().course[4].id);
    // print(Edit().course[4].courseName);
    // print(Edit().course[4].imageUrl);
    // print(Edit().course[4].courseDetails);
  }

  void addBook(String id,
      String bookName,
      String imageUrl,
      String bookDetails,) {
    _book.add(Book(
        id: id,
        bookName: bookName,
        imageUrl: imageUrl,
        bookDetails: bookDetails));
    notifyListeners();
  }
}
