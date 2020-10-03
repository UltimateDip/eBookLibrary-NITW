import 'package:e_book_library_nitw/EditCourseData.dart';
import 'package:e_book_library_nitw/Manage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookViewLibrarian extends StatefulWidget {
  BookViewLibrarian(this.courseId);

  final courseId;

  @override
  _BookViewLibrarianState createState() => _BookViewLibrarianState();
}

class _BookViewLibrarianState extends State<BookViewLibrarian> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final bookData = Provider.of<Edit>(context);
    final books = bookData.book;
    final bookLength = books.length;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: deviceSize.height * 0.1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
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
                            text: "Books",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ManageBook(widget.courseId),
                          ),
                        );
                      },
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text('ADD BOOK'),
                    ),
                  ],
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
                itemCount: bookLength,
                itemBuilder: (context, index) {
                  return _buildBooks(context, 'B${index + 1}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBooks(BuildContext context, String bookId) {
  final deviceSize = MediaQuery.of(context).size;
  final bookData = Provider.of<Edit>(context);
  final books = bookData.book;
  final bookLength = books.length;
  int i = 0;
  while (books[i].id != bookId && i < bookLength) {
    i++;
  }
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      height: deviceSize.height * 0.15,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              //TODO
              child: Image.network(books[i].imageUrl),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: deviceSize.height,
            width: deviceSize.width * 0.4,
            padding: EdgeInsets.all(10),
            child: Text(
              books[i].bookDetails,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.05,
                width: deviceSize.height * 0.11,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    //TODO link of corresponding book
                  },
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('OPEN'),
                ),
              ),
              SizedBox(
                height: 10,
                width: 75,
              ),
              Container(
                height: deviceSize.height * 0.05,
                width: deviceSize.height * 0.11,
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    //TODO DELETE content

                  },
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text('DELETE'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
