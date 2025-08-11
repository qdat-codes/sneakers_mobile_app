import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_mobile_app/controllers/product_provider.dart';
import 'package:sneakers_mobile_app/models/product/product_model.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';
import 'package:sneakers_mobile_app/views/shared/new_shoes.dart';
import 'package:sneakers_mobile_app/views/shared/product_cart.dart';
import 'package:sneakers_mobile_app/views/ui/product/product_page.dart';
import 'package:sneakers_mobile_app/views/ui/widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<ProductModel>> products,
    required this.tabIndex,
  }) : _products = products;

  final Future<List<ProductModel>> _products;
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.435.h,
          child: FutureBuilder<List<ProductModel>>(
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
                return ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        productNotifier.shoeSizes = product.sizes;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ProductPage(
                                  id: product.id,
                                  category: product.category,
                                ),
                          ),
                        );
                      },
                      child: ProductCard(
                        name: product.name,
                        category: product.category,
                        id: product.id,
                        price: product.price,
                        image: product.imageUrl,
                        isColor: true,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 15.w, 12.w, 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lastest Shoes",
                    style: appstyle(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ProductByCart(tabIndex: tabIndex),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appstyle(22, Colors.black, FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.black,
                          size: 28.sp,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: FutureBuilder<List<ProductModel>>(
            future: _products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error ${snapshot.error}"));
              } else {
                if (snapshot.data!.isEmpty) {
                  return Center(child: Text("No products available"));
                }
                final products = snapshot.data!;
                return ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoes = products[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: NewShoes(imageUrl: shoes.imageUrl),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
