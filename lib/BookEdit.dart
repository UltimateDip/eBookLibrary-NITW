import 'package:flutter/material.dart';

class BookEdit extends StatefulWidget {
  static const id = 'book_details';

  BookEdit(this.courseId);

  final courseId;

  @override
  _BookEditState createState() => _BookEditState();
}

class _BookEditState extends State<BookEdit> {
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
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'CourseName : ${widget.courseId}',
                      ),
                    ),
                    RaisedButton(
                      onPressed: null,
                      child: Text("delete"),
                      color: Colors.blue,
                    )
                  ],
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
