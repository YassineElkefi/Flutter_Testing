import 'package:flutter/material.dart';
import 'package:flutter_testing/screens/add_product_dialog.dart';
import 'package:flutter_testing/screens/product_details_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  final List<String> _products = ['iPhone 13', 'Samsung Galaxy S21', 'Google Pixel 6', 'OnePlus 9', 'Xiaomi Mi 11'];

  void _addProduct(String product_name){
    setState(() {
      _products.add(product_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index){
                return ListTile(
                  key: Key('product_$index'),
                  title: Text(_products[index]),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetailsPage(productName: _products[index])),
                    );
                  },
                );
              }),),
          ElevatedButton(
            key: const Key('add_product_button'),
            onPressed: ()async{
              final result = await showDialog(context: context, builder: (context)=> AddProductDialog());
              if(result != null){
                _addProduct(result as String);
              }
            },
            child: const Text('Add Product'),
          ),
        ],
      )
    );
  }
}