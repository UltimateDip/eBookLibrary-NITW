import 'package:flutter/foundation.dart';

class Course {
  final String id;
  final String courseName;
  final String imageUrl;
  final String courseDetails;

  Course({
    @required this.id,
    @required this.courseName,
    @required this.imageUrl,
    @required this.courseDetails,
  });
}

class Book {
  final String id;
  final String bookName;
  final String imageUrl;
  final String bookDetails;

  Book({
    @required this.id,
    @required this.bookName,
    @required this.imageUrl,
    @required this.bookDetails,
  });
}
