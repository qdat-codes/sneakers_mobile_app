import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_mobile_app/config/components/reusable_text.dart';
import 'package:sneakers_mobile_app/controllers/product_provider.dart';
import 'package:sneakers_mobile_app/services/product_service.dart';
import '../../shared/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );

  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context, listen: false);
    productNotifier.menProducts = _productService.fetchMenProducts();
    productNotifier.womenProducts = _productService.fetchWomenProducts();
    productNotifier.kidProducts = _productService.fetchKidProducts();

    return Scaffold(
      body: SizedBox(
        height: 812.h,
        width: 375.w,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 45.h, 0, 0),
              height: MediaQuery.of(context).size.height.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8.w, bottom: 15.h),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      style: appstyleWithHt(
                        30,
                        Colors.white,
                        FontWeight.bold,
                        1.5,
                      ),
                      text: "Athletics Shoes",
                    ),
                    ReusableText(
                      style: appstyleWithHt(
                        20,
                        Colors.white,
                        FontWeight.w500,
                        1.2,
                      ),
                      text: "Collection 2025",
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
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.225.h,
              ),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                padding: EdgeInsets.only(left: 12.w),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomeWidget(
                      products: productNotifier.menProducts,
                      tabIndex: 0,
                    ),
                    HomeWidget(
                      products: productNotifier.womenProducts,
                      tabIndex: 1,
                    ),
                    HomeWidget(
                      products: productNotifier.kidProducts,
                      tabIndex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
