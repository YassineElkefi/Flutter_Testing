import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testing/screens/success_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// "email" : "eve.holt@reqres.in",
// "password" : "cityslicka"
class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _login()async{
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url = Uri.parse('https://reqres.in/api/login');
    try{
      final response = await http.post(
        url,
        body: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessPage(token: data['token'],)),
        );
      }else{
        final errorData = jsonDecode(response.body);
        setState(() {
          _errorMessage = errorData['error'];
          _isLoading = false;
        });
  }
    }catch(e){
      setState(() {
        _errorMessage = 'Something went wrong, Please try again';
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            key: const ValueKey('emailField'),
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            key: const ValueKey('passwordField'),
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20,),
          if(_isLoading)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              key: const ValueKey('loginButton'),
              onPressed: _login,
              child: const Text('Login'),
            ),
          if(_errorMessage != null) ... [
            const SizedBox(height: 20,),
            Text(
              _errorMessage!,
              key: const ValueKey('errorText'),
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
            ),
          ]
        ],
      ),),
      
    );
  }
}