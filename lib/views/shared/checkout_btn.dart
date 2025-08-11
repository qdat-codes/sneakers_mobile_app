import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key, this.onTap, required this.label});

  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            label,
            style: appstyle(20, Colors.white, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
