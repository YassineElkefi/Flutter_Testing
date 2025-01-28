import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  num _result = 0;

  TextEditingController numberController = TextEditingController();

  void _calculateTheSquare(){
    num numberInput = num.parse(numberController.text.trim());
    setState(() {
      _result = numberInput * numberInput;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
            ),
            Text(
              "$_result",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _calculateTheSquare,
              child: const Text("Calculate"),
            ),
          ],),
      ),
    );
  }
}