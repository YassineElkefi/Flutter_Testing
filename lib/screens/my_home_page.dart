import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title, required this.message, this.icon});


  final String title;
  final String message;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
      appBar: AppBar(
        key: const Key("appBar"),
        title: Text(title),
      ),
      body: Center(
        child: Row(
          children: [
            Text(message),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    ),
    );
  }
}