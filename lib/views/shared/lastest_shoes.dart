import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sneakers_mobile_app/models/product/product_model.dart';
import 'package:sneakers_mobile_app/views/shared/product_card.dart';
import 'package:sneakers_mobile_app/views/shared/stagger_tile.dart';
import 'package:sneakers_mobile_app/views/ui/product/product_page.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

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
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2, // 2 item mỗi hàng
            mainAxisSpacing: 16.h,
            itemCount: products.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductPage(
                          id: product.id,
                          category: product.category,
                        );
                      },
                    ),
                  );
                },
                child: StaggerTile(
                  name: product.name,
                  price: product.price,
                  imageUrl: product.imageUrl[0],
                ),
              );
            },
            staggeredTileBuilder:
                (index) => StaggeredTile.extent(
                  (index % 2 == 0) ? 1 : 1,
                  (index % 4 == 1 || index % 4 == 3) ? 285.h : 252.h,
                ),
          );
        }
      },
    );
  }
}
