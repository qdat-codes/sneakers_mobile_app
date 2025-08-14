import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sneakers_mobile_app/config/components/cached_network_image.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';
import 'package:sneakers_mobile_app/views/shared/checkout_btn.dart';

void doNothing(BuildContext context) {}

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cartBox = Hive.box('cart_box');

  @override
  Widget build(BuildContext context) {
    List<dynamic> cart = [];
    final cartData =
        _cartBox.keys.map((key) {
          final item = _cartBox.get(key);
          return {
            "key": key,
            "id": item['id'],
            "category": item['category'],
            "name": item['name'],
            "imageUrl": item['imageUrl'],
            "price": item['price'],
            "quantity": item['quantity'],
            "sizes": item['sizes'],
          };
        }).toList();
    cart = cartData.reversed.toList();
    var elevatedButton = ElevatedButton(
      onPressed: () {
        if (cart.isEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Your cart is empty")));
        } else {
          Navigator.pushNamed(context, '/checkout');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(double.infinity, 50.h),
      ),
      child: Text(
        "Checkout",
        style: appstyle(18, Colors.white, FontWeight.bold),
      ),
    );
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
                    itemCount: cart.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = cart[index];
                      return Padding(
                        padding: EdgeInsets.all(8.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                          child: Slidable(
                            key: const ValueKey(0),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  flex: 1,
                                  onPressed: (context) {
                                    _cartBox.delete(data['key']);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "${data['name']} removed from cart",
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: const Color(0xFF000000),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.16,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.w),
                                        child: CustomCachedNetworkImage(
                                          imageUrl: data['imageUrl'],
                                          boxFit: BoxFit.fill,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 12.h,
                                          left: 12.w,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.51,
                                              child: Text(
                                                data['name'],
                                                style: appstyle(
                                                  16,
                                                  Colors.black,
                                                  FontWeight.bold,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
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
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              16.r,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  // cartProdovider.increament();
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
                                                  // cartProdovider.decreament();
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
                                ],
                              ),
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
