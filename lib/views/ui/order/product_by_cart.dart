import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sneakers_mobile_app/models/product/product_model.dart';
import 'package:sneakers_mobile_app/services/product_service.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';

import '../../shared/widgets.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key});

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );

  final ProductService _productService = ProductService();

  late Future<List<ProductModel>> _menProducts;
  late Future<List<ProductModel>> _womenProducts;
  late Future<List<ProductModel>> _kidProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _menProducts = _productService.fetchMenProducts();
    _womenProducts = _productService.fetchWomenProducts();
    _kidProducts = _productService.fetchKidProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height.h,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 45.w, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 12.w, 16.w, 18.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(text: "Men Shoes"),
                      Tab(text: "Women Shoes"),
                      Tab(text: "Kids Shoes"),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(
                top: MediaQuery.of(context).size.height * 0.2.h,
                left: 16.w,
                right: 12.w,
              ),
              child: TabBarView(
                controller: _tabController,
                children: [
                  FutureBuilder<List<ProductModel>>(
                    future: _menProducts,
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
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductCart(
                              name: product.name,
                              category: product.category,
                              id: product.id,
                              price: product.price,
                              image: product.imageUrl,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
