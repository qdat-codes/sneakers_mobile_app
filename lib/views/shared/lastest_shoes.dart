import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sneakers_mobile_app/models/product/product_model.dart';
import 'package:sneakers_mobile_app/views/shared/product_card.dart';

class ProductLastest extends StatelessWidget {
  const ProductLastest({
    super.key,
    required Future<List<ProductModel>> products,
  }) : _products = products;

  final Future<List<ProductModel>> _products;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error ${snapshot.error}"));
        } else {
          if (snapshot.data!.isEmpty) {
            return Center(child: Text("No products avalable"));
          }
          final products = snapshot.data!;
          return MasonryGridView.count(
            crossAxisCount: 2, // 2 item mỗi hàng
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                name: product.name,
                category: product.category,
                id: product.id,
                price: product.price,
                imageUrl: product.imageUrl,
                isColor: false,
              );
            },
          );
        }
      },
    );
  }
}
