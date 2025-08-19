import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_mobile_app/controllers/product_provider.dart';
import 'package:sneakers_mobile_app/services/product_service.dart';

import '../../shared/widgets.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context, listen: true);
    productNotifier.menProducts = ProductService().fetchMenProducts();
    productNotifier.womenProducts = ProductService().fetchWomenProducts();
    productNotifier.kidProducts = ProductService().fetchKidProducts();

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height.h,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 45.w, 0, 0),
              height: MediaQuery.of(context).size.height,
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
                            filterProducts();
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
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ProductLastest(products: productNotifier.menProducts),
                    ProductLastest(products: productNotifier.womenProducts),
                    ProductLastest(products: productNotifier.kidProducts),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filterProducts() {
    double value = 100;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder:
          (context) => Container(
            height: MediaQuery.of(context).size.height * 0.80.h,
            width: MediaQuery.of(context).size.width.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Container(
                  height: 5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomerSpacer(),
                      Center(
                        child: Text(
                          "Filter",
                          style: appstyle(40, Colors.black, FontWeight.bold),
                        ),
                      ),
                      const CustomerSpacer(),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 15.w),
                        child: Text(
                          "Gender: ",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: CategoryBtn(
                              label: "Men",
                              btnColor: Colors.black,
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: CategoryBtn(
                              label: "Women",
                              btnColor: Colors.black,
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: CategoryBtn(
                              label: "Kids",
                              btnColor: Colors.black,
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                      CustomerSpacer(),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 15.w),
                        child: Text(
                          "Category: ",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: CategoryBtn(
                              label: "Shoes",
                              btnColor: Colors.black,
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: CategoryBtn(
                              label: "Apparrels",
                              btnColor: Colors.black,
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: CategoryBtn(
                              label: "Accessori",
                              btnColor: Colors.black,
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                      CustomerSpacer(),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 15.w),
                        child: Text(
                          "Price: ",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Slider(
                        value: value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        label: value.toString(),
                        secondaryTrackValue: 200,
                        onChanged: (double value) {},
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 15.w),
                        child: Text(
                          "Brand: ",
                          style: appstyle(20, Colors.black, FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          height: 80.h,
                          child: ListView.builder(
                            itemCount: brand.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Image.asset(
                                    brand[index],
                                    height: 60.h,
                                    width: 80.w,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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
