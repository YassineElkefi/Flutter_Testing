import 'package:flutter/material.dart';

class ListItemsPage extends StatelessWidget {
  const ListItemsPage({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          key: const Key('long_list'),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index],
              key: Key('item_${index}_text'),
              ),
            );
          },
        ),
      ),
    );
  }
}