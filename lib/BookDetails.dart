import 'package:flutter/material.dart';

class BookDetails extends StatefulWidget {
  static const id = 'book_details';

  BookDetails(this.courseId);

  final courseId;

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: deviceSize.height / 5,
                child: Center(
                  child: Text(
                    'CourseName : ${widget.courseId}',
                  ),
                ),
              ),
              Container(
                color: Colors.teal,
                height: deviceSize.height / 5,
                child: Center(child: Text("Here wil be the book image")),
              ),
              Container(
                color: Colors.blue,
                height: deviceSize.height / 5,
                child: Center(child: Text("here book Details")),
              ),
              Container(
                color: Colors.lightGreen,
                child: Center(child: Text("Here book link")),
                height: deviceSize.height / 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
