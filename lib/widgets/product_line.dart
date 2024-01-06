import 'package:flutter/material.dart';
import 'package:food_bar/models/product.dart';

class ProductLine extends StatelessWidget {
  final FoodProduct product;
  const ProductLine({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/product_detail', arguments: product);
          },
          title: Text(product.productNameEn),
          trailing: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage: NetworkImage(product.imageFrontSmallUrl),
            ),
          ),
          leading: Text(product.id.toString()),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
