import 'package:flutter/material.dart';
import 'package:food_bar/models/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _product = ModalRoute.of(context)!.settings.arguments as FoodProduct;
    return Scaffold(
      appBar: AppBar(title: Text('hey'),),
    );
  }
}