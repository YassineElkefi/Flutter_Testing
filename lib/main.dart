import 'package:flutter/material.dart';
import 'package:flutter_testing/screens/list_items_page.dart';

void main() {
  runApp(ListItemsPage(items: List<String>.generate(1000, (i) => 'Item $i'),));
}

