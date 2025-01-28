// Add Product Dialog
import 'package:flutter/material.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  TextEditingController _productController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _productController,
            key: const Key('product_name_field'),
            decoration: const InputDecoration(
              hintText: 'Product Name',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            key: const Key('add_product_dialog_button'),
            onPressed: (){
              Navigator.pop(context, _productController.text.trim());
            },
            child: const Text('Add Product'),
          ),
        ],
      ),
    );
  }
}