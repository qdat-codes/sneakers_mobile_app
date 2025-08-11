import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_mobile_app/controllers/product_provider.dart';
import 'package:sneakers_mobile_app/models/product/product_model.dart';
import 'package:sneakers_mobile_app/services/product_service.dart';
import 'package:sneakers_mobile_app/views/shared/widgets.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});

  final String id;
  final String category;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();

  final _cartBox = Hive.box('cart_box');
  late Future<ProductModel> _product;

  void getShoes() {
    if (widget.category == "men") {
      _product = ProductService().fetchMenProductsById(widget.id);
    } else if (widget.category == "women") {
      _product = ProductService().fetchWomenProductsById(widget.id);
    } else {
      _product = ProductService().fetchKidProductsById(widget.id);
    }
  }

  Future<void> _createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  @override
  void initState() {
    super.initState();
    getShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProductModel>(
        future: _product,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text("Error: ${snapshot.error}"),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Go Back"),
                  ),
                ],
              ),
            );
          } else {
            final product = snapshot.data;

            if (product == null) {
              return const Center(child: Text("Product not found"));
            }

            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      leadingWidth: 0,
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                productNotifier.shoeSizes.clear();
                              },
                              child: const Icon(Icons.close),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: const Icon(
                                  Icons.more_horiz,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: product.imageUrl.length,
                                controller: pageController,
                                onPageChanged: (page) {
                                  productNotifier.activePage = page;
                                },
                                itemBuilder: (context, int index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.4,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.grey.shade300,
                                        child: CachedNetworkImage(
                                          imageUrl: product.imageUrl[index],
                                          fit: BoxFit.contain,
                                          placeholder:
                                              (context, url) => const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                          errorWidget: (context, url, error) {
                                            return Container(
                                              color: Colors.grey.shade300,
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.image_not_supported,
                                                    size: 64,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    "Image not available",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Positioned(
                                        top:
                                            MediaQuery.of(context).size.height *
                                            0.1,
                                        right: 20.w,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.grey,
                                            size: 28.sp,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ...List<Widget>.generate(
                                              3,
                                              (index) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 4.w,
                                                ),
                                                child: CircleAvatar(
                                                  radius: 5.r,
                                                  backgroundColor:
                                                      productNotifier
                                                                  .activePage !=
                                                              index
                                                          ? Colors.grey
                                                          : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 30,
                                        left: 0,
                                        right: 0,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.r),
                                            topRight: Radius.circular(30.r),
                                          ),
                                          child: Container(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width,
                                            color: Colors.white,
                                            child: Padding(
                                              padding: EdgeInsets.all(12.r),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.name,
                                                    style: appstyle(
                                                      32,
                                                      Colors.black,
                                                      FontWeight.w600,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        product.category,
                                                        style: appstyle(
                                                          20,
                                                          Colors.grey,
                                                          FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      RatingBar.builder(
                                                        initialRating: 4,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemSize: 22,
                                                        itemPadding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 1.w,
                                                            ),
                                                        itemBuilder:
                                                            (
                                                              context,
                                                              _,
                                                            ) => Icon(
                                                              Icons.star,
                                                              size: 18.sp,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                        onRatingUpdate:
                                                            (rating) {},
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\$${product.price}",
                                                        style: appstyle(
                                                          26,
                                                          Colors.black,
                                                          FontWeight.w600,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Colors",
                                                            style: appstyle(
                                                              18,
                                                              Colors.black,
                                                              FontWeight.w500,
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          CircleAvatar(
                                                            radius: 7.r,
                                                            backgroundColor:
                                                                Colors.black,
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          CircleAvatar(
                                                            radius: 7.r,
                                                            backgroundColor:
                                                                Colors.red,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20.h),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Select sizes",
                                                            style: appstyle(
                                                              20,
                                                              Colors.black,
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                          SizedBox(width: 20.w),
                                                          Text(
                                                            "View size guide",
                                                            style: appstyle(
                                                              20,
                                                              Colors.grey,
                                                              FontWeight.w600,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      SizedBox(
                                                        height: 40.h,
                                                        child: ListView.builder(
                                                          itemCount:
                                                              productNotifier
                                                                  .shoeSizes
                                                                  .length,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemBuilder: (
                                                            context,
                                                            index,
                                                          ) {
                                                            final sizes =
                                                                productNotifier
                                                                    .shoeSizes[index];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets.symmetric(
                                                                    horizontal:
                                                                        6.w,
                                                                  ),
                                                              child: ChoiceChip(
                                                                showCheckmark:
                                                                    false,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        60.r,
                                                                      ),
                                                                  side: BorderSide(
                                                                    color:
                                                                        Colors
                                                                            .black,
                                                                    width: 1.w,
                                                                    style:
                                                                        BorderStyle
                                                                            .solid,
                                                                  ),
                                                                ),
                                                                disabledColor:
                                                                    Colors
                                                                        .white,
                                                                selectedColor:
                                                                    Colors
                                                                        .black,
                                                                padding:
                                                                    EdgeInsets.symmetric(
                                                                      vertical:
                                                                          8.h,
                                                                    ),
                                                                label: Text(
                                                                  sizes.size,
                                                                  style: appstyle(
                                                                    18,
                                                                    sizes.isSelected
                                                                        ? Colors
                                                                            .white
                                                                        : Colors
                                                                            .black,
                                                                    FontWeight
                                                                        .w500,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                selected:
                                                                    sizes
                                                                        .isSelected,
                                                                onSelected: (
                                                                  newState,
                                                                ) {
                                                                  if (productNotifier
                                                                      .sizes
                                                                      .contains(
                                                                        sizes
                                                                            .size,
                                                                      )) {
                                                                    productNotifier
                                                                        .sizes
                                                                        .remove(
                                                                          sizes
                                                                              .size,
                                                                        );
                                                                  } else {
                                                                    productNotifier
                                                                        .sizes
                                                                        .add(
                                                                          sizes
                                                                              .size,
                                                                        );
                                                                  }
                                                                  productNotifier
                                                                      .toggleCheck(
                                                                        index,
                                                                      );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Divider(
                                                    indent: 10,
                                                    endIndent: 10,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width,
                                                    child: Text(
                                                      product.title,
                                                      style: appstyle(
                                                        20,
                                                        Colors.black,
                                                        FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Text(
                                                    product.description,
                                                    maxLines: 4,
                                                    style: appstyle(
                                                      14,
                                                      Colors.black,
                                                      FontWeight.normal,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  CheckoutButton(
                                                    onTap: () async {
                                                      _createCart({
                                                        "id": product.id,
                                                        "name": product.name,
                                                        "category":
                                                            product.category,
                                                        "sizes":
                                                            productNotifier
                                                                .sizes,
                                                        "imageUrl":
                                                            product.imageUrl[0],
                                                        "price": product.price,
                                                        "quantity": 1,
                                                      });
                                                      productNotifier.sizes
                                                          .clear();
                                                      Navigator.pop(context);
                                                    },
                                                    label: 'Add to Cart',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
