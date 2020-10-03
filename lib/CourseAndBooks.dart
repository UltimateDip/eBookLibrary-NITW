import 'package:e_book_library_nitw/CourseBook2.dart';
import 'package:e_book_library_nitw/EditCourseData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CourseAndBook extends StatefulWidget {
  static const id = 'courses_and_books';

  @override
  _CourseAndBookState createState() => _CourseAndBookState();
}

class _CourseAndBookState extends State<CourseAndBook> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final courseData = Provider.of<Edit>(context);
    final courses = courseData.course;
    final courseLength = courses.length;

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
                        text: "Courses",
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
              child: ListView.builder(
                itemCount: courseLength,
                itemBuilder: (context, index) {
                  return _buildCourses(context, 'C${index + 1}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCourses(BuildContext context, String courseId) {
  final deviceSize = MediaQuery.of(context).size;
  final courseData = Provider.of<Edit>(context);
  final courses = courseData.course;
  final courseLength = courses.length;
  int i = 0;
  while (courses[i].id != courseId && i < courseLength) {
    i++;
  }
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CourseBook2(courseId),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        height: deviceSize.height * .15,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Image.network(courses[i].imageUrl),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: deviceSize.height,
              width: deviceSize.width / 2,
              padding: EdgeInsets.all(10),
              child: Text(
                courses[i].courseDetails,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
