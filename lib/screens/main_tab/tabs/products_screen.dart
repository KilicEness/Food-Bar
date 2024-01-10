import 'package:flutter/material.dart';
import 'package:food_bar/widgets/product_line.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:food_bar/models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String _errorMessage = '';
  bool _fetching = false;
  List<FoodProduct> _product = [];

  Future<void> getProducts() async {
    try {
      setState(() {
        _fetching = true;
      });

      var url =
          Uri.https('world.openfoodfacts.org', 'api/v2/product/737628064502');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw 'Service is not working';
      }

      var jsonResponse = convert.jsonDecode(response.body);

      List<FoodProduct> responseProduct = [];

      for (var product in jsonResponse['product'] as List) {
        FoodProduct foodProduct = FoodProduct(
            id: product['id'],
            keywords: product['keywords'],
            allergensTags: product['allergensTags'],
            brands: product['id'],
            categories: product['id'],
            countries: product['countries'],
            dataQualityWarningsTags: product['dataQualityWarningsTags'],
            genericNameEn: product['genericNameEn'],
            imageFrontSmallUrl: product['id'],
            ingredientsTextEn: product['ingredientsTextEn'],
            productNameEn: product['id']);
        responseProduct.add(foodProduct);
      }
      setState(() {
        _product = responseProduct;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _fetching = false;
      });
    }
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          actions: [
            if (_fetching)
              Container(
                margin: EdgeInsets.all(17),
                height: 20,
                width: 23,
                child: (const CircularProgressIndicator(
                  color: Colors.black,
                )),
              ),
            if (!_fetching)
              (IconButton(
                onPressed: getProducts,
                icon: const Icon(Icons.refresh),
              ))
          ],
        ),
        body: _fetching
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  var product = _product[index];
                  return ProductLine(product: product);
                },
                itemCount: _product.length,
              ));
  }
}
