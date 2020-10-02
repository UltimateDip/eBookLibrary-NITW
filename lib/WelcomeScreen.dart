import 'package:e_book_library_nitw/LoginScreen.dart';
import 'package:e_book_library_nitw/LoginScreen_L.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Container(
                      height: deviceSize.height / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'images/Library.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'NITW logo',
                    child: Container(
                      height: deviceSize.height / 10,
                      width: deviceSize.height / 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'images/nitwlogo.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'e-book Library name',
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "e-Book ",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            TextSpan(
                              text: "Library",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Material(
                  elevation: 10.0,
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    minWidth: deviceSize.width * 0.8,
                    height: 42.0,
                    child: Text('Student Login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Material(
                  elevation: 10.0,
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                  child: MaterialButton(
                    minWidth: deviceSize.width * 0.8,
                    height: 42.0,
                    child: Text('Librarian Login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthScreenL(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
