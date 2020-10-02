import 'package:e_book_library_nitw/CourseAndBooks.dart';
import 'package:e_book_library_nitw/LibrarianView.dart';
import 'package:flutter/material.dart';

enum AuthMode { LibrarianLogin, StudentLogin }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Container(
                height: 180,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Hero(
                        tag: 'NITW logo',
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'images/nitwlogo.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Hero(
              tag: 'e-book Library Logo',
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "e-Book ",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      TextSpan(
                        text: "Library",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AuthCard(),
          ],
        ),
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.StudentLogin;
  Map<String, String> _authData = {
    'email/rgNo': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      //invalid
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    //TODO
    if (_authMode == AuthMode.StudentLogin) {
      //TODO for students
      Navigator.of(context).pushReplacementNamed(CourseAndBook.id);
    } else {
      //TODO for librarian
      Navigator.of(context).pushReplacementNamed(LibrarianView.id);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.StudentLogin) {
      setState(() {
        _authMode = AuthMode.LibrarianLogin;
      });
    } else {
      setState(() {
        _authMode = AuthMode.StudentLogin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText:
                            '${_authMode == AuthMode.StudentLogin ? 'Registration Number' : 'E-mail'}',
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
                      onSaved: (value) {
                        _authData['email/rgNo'] = value;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Password',
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
                      obscureText: true,
                      controller: _passwordController,
                      // ignore: missing_return
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  if (_isLoading) CircularProgressIndicator(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //login button
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Material(
                      elevation: 5.0,
                      color: _authMode == AuthMode.StudentLogin
                          ? Colors.indigo
                          : Colors.green,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: () {
                          //This is temporary , actual action is comment out below
                          //TODO
                          Navigator.pushReplacementNamed(context,
                              CourseAndBook.id);
                        }, //_submit,
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text('LOGIN '),
                      ),
                    ),
                  ),

                  //sign up <-> login exchange button
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10, top: 20, right: 10),
                    child: Material(
                      elevation: 5.0,
                      color: _authMode == AuthMode.StudentLogin
                          ? Colors.green
                          : Colors.indigo,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: _switchAuthMode,
                        minWidth: 200.0,
                        height: 42.0,
                        child: Text(
                          '${_authMode == AuthMode.StudentLogin ? 'LIBRARIAN ' : 'STUDENT '}LOGIN INSTEAD',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
