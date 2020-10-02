import 'package:e_book_library_nitw/BookEdit.dart';
import 'package:flutter/material.dart';

class LibrarianView extends StatefulWidget {
  static const id = 'librarian_view';

  @override
  _LibrarianViewState createState() => _LibrarianViewState();
}

class _LibrarianViewState extends State<LibrarianView> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.blue[200],
              height: deviceSize.height * 0.125,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Courses",
                        style: TextStyle(
                          color: Colors.black,
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
              color: Colors.blue[200],
              height: deviceSize.height * 0.8,
              child: ListView(
                children: <Widget>[
                  _buildCourses(context, 'C1'),
                  _buildCourses(context, 'C2'),
                  _buildCourses(context, 'C3'),
                  _buildCourses(context, 'C4'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCourses(BuildContext context, String courseId) {
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: InkWell(
      onTap: () {
//TODO : navigate to books
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookEdit(courseId),
          ),
        );
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: Text(
          courseId,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}
