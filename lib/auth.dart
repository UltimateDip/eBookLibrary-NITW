import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlPart) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlPart?key=AIzaSyBKjVUdOuyK9igscb9EV9RjDOMtkTWJ5hU';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    await _authenticate(email, password, 'signInWithPassword');
    notifyListeners();
  }

  notifyListeners();
}
