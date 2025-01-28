import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Success"),),
    body: Center(
      child: Text("Login successful : $token", style: TextStyle(fontSize: 20),),
    ),);
  }
}