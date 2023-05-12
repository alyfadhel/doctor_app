import 'dart:convert';
import 'package:doctor_master/screens/category_second/category_second__screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _passward;

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('https://bsubackendapi.com/api?action=loginn'),
      body: {
        'email': _username,
        'password': _passward,
      },
    );
    final responseData = json.decode(response.body);
    // Here you can handle the response from your API
    // For example, you can check if the login was successful and navigate to the home page
    if (responseData['success']) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => categorysecondscreen(),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login failed'),
          content: Text(responseData['message']),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                onSaved: (input) => _username = input!,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (input) => _passward = input!,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _login();
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}