import 'package:e_book_library_nitw/EditCourseData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManageCourse extends StatefulWidget {
  @override
  _ManageCourseState createState() => _ManageCourseState();
}

class _ManageCourseState extends State<ManageCourse> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final courseData = Provider.of<Edit>(context);
    String id = '';
    String courseName = '';
    String imageUrl = '';
    String courseDetails = '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: deviceSize.height * 0.1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Add Course",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            Container(
              color: Colors.white,
              height: deviceSize.height * 0.8,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Course ID',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Course ID can't be empty";
                        }
                      },
                      onSaved: (value) {
                        id = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Course Name',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Course Name can't be empty";
                        }
                      },
                      onSaved: (value) {
                        courseName = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Image Link of Course (google drive)',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty ||
                            !value.contains('view?usp=sharing')) {
                          return "Invalid Link";
                        }
                      },
                      onSaved: (value) {
                        final str = value;
                        final start = 'google.com/file/d/';
                        final end = '/view?usp=';
                        final startIndex = str.indexOf(start);
                        final endIndex =
                            str.indexOf(end, startIndex + start.length);

                        imageUrl =
                            'https://drive.google.com/uc?export=view&id=' +
                                str.substring(
                                    startIndex + start.length, endIndex);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintMaxLines: 2,
                        hintText:
                            'Course Details: Enter details in about 30 words',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field shouldn't be empty";
                        }
                      },
                      onSaved: (value) {
                        courseDetails = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: RaisedButton(
                      onPressed: () {
                        courseData.addCourse(
                            id, courseName, imageUrl, courseDetails);
                      },
                      color: Colors.green[400],
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ManageBook extends StatefulWidget {
  ManageBook(@required this.courseId);

  final courseId;

  @override
  _ManageBookState createState() => _ManageBookState();
}

class _ManageBookState extends State<ManageBook> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final bookData = Provider.of<Edit>(context);
    String id = '';
    String bookName = '';
    String imageUrl = '';
    String bookDetails = '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: deviceSize.height * 0.1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${widget.courseId}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text: " / ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text: "Add Book",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            Container(
              color: Colors.white,
              height: deviceSize.height * 0.8,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter Book ID',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Book ID can't be empty";
                        }
                      },
                      onSaved: (value) {
                        id = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Book Name',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Book Name can't be empty";
                        }
                      },
                      onSaved: (value) {
                        bookName = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Image Link of Book (google drive)',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty ||
                            !value.contains('view?usp=sharing')) {
                          return "Invalid Link";
                        }
                      },
                      onSaved: (value) {
                        final str = value;
                        final start = 'google.com/file/d/';
                        final end = '/view?usp=';
                        final startIndex = str.indexOf(start);
                        final endIndex =
                            str.indexOf(end, startIndex + start.length);

                        imageUrl =
                            'https://drive.google.com/uc?export=view&id=' +
                                str.substring(
                                    startIndex + start.length, endIndex);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintMaxLines: 2,
                        hintText:
                            'Book Details: Enter details in about 30 words',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 16.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This field shouldn't be empty";
                        }
                      },
                      onSaved: (value) {
                        bookDetails = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
                    child: RaisedButton(
                      onPressed: () {
                        bookData.addBook(id, bookName, imageUrl, bookDetails);
                      },
                      color: Colors.green[400],
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
