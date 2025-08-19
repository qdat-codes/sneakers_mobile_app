import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_mobile_app/config/components/cached_network_image.dart';
import 'package:sneakers_mobile_app/controllers/cart_provider.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';
import 'package:sneakers_mobile_app/views/shared/checkout_btn.dart';

void doNothing(BuildContext context) {}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    var cartNotifier = Provider.of<CartNotifier>(context, listen: true);
    cartNotifier.getCart();
    return Scaffold(
      backgroundColor: const Color(0xffe2e2e2),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close, color: Colors.black),
                ),
                Text(
                  "My Cart",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                    itemCount: cartNotifier.cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cartNotifier.cart[index];
                      return Padding(
                        padding: EdgeInsets.all(8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade500,
                                  spreadRadius: 5,
                                  blurRadius: 0.3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12.w),
                                          child: CustomCachedNetworkImage(
                                            imageUrl: data['imageUrl'],
                                            boxFit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 12.h),
                                          child: Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data['name'],
                                                  style: appstyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.bold,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SizedBox(height: 5.h),
                                                Text(
                                                  data['category'],
                                                  style: appstyle(
                                                    14,
                                                    Colors.grey,
                                                    FontWeight.w600,
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "\$${data['price']}",
                                                      style: appstyle(
                                                        16,
                                                        Colors.black,
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.w),
                                                    Text(
                                                      "Size: ${data['sizes'].join(', ')}",
                                                      style: appstyle(
                                                        14,
                                                        Colors.black,
                                                        FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: -2,
                                      child: GestureDetector(
                                        onTap: () {
                                          cartNotifier.deleteCart(data['key']);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "${data['name']} removed from cart",
                                              ),
                                            ),
                                          );
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => const CartPage(),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 40.w,
                                          height: 30.h,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12.r),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.r),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            cartNotifier.increment();
                                          },
                                          child: Container(
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              size: 20.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          data['quantity'].toString(),
                                          style: appstyle(
                                            16,
                                            Colors.black,
                                            FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cartNotifier.decrement();
                                          },
                                          child: Container(
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 20.sp,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
