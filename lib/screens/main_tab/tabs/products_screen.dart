import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:food_bar/models/product.dart';

class ProductsScreen extends StatefulWidget {
  final String barcode;
  const ProductsScreen({Key? key, required this.barcode}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late String barcode;
  String _errorMessage = '';
  bool _fetching = false;
  FoodProduct? _product;

  Future<void> getProducts() async {
    try {
      setState(() {
        _fetching = true;
      });

      var url =
          Uri.https('world.openfoodfacts.org', 'api/v2/product/${barcode}');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw 'Service is not working';
      }

      var jsonResponse = convert.jsonDecode(response.body);

      FoodProduct responseProduct = FoodProduct.fromJson(jsonResponse);

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
    barcode = widget.barcode;
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar'ın rengi
        iconTheme:
            IconThemeData(color: Colors.black), // Geri tuşu (back button) rengi
        title: const Text('Product Details',
            style: TextStyle(color: Colors.black)), // Başlık rengi
        actions: [
          if (_fetching)
            Container(
              margin: EdgeInsets.all(17),
              height: 20,
              width: 23,
              child: const CircularProgressIndicator(
                color: Colors.black, // CircularProgressIndicator rengi
              ),
            ),
          if (!_fetching)
            IconButton(
              onPressed: getProducts,
              icon: const Icon(Icons.refresh,
                  color: Colors.black), // Refresh ikonu rengi
            ),
        ],
      ),
      body: _fetching
          ? Center(child: CircularProgressIndicator())
          : _product != null
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      buildInfoRow('Product Name', _product!.productNameEn),
                      buildInfoRow('Product ID', _product!.id),
                      buildInfoRow('Keywords', _product!.keywords.join(', ')),
                      buildInfoRow('Brands', _product!.brands),
                      buildInfoRow('Categories', _product!.categories),
                      buildInfoRow('Generic Name', _product!.genericNameEn),
                      buildInfoRow('Data Quality Warnings',
                          _product!.dataQualityWarningsTags.join(', ')),
                      buildInfoRow('Ingredients', _product!.ingredientsTextEn),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            _product!.imageFrontSmallUrl,
                            width: double.infinity,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(child: Text('No product data available')),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
