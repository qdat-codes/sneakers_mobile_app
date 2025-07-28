import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.white, // màu bóng
            blurRadius: 0.8.w, // độ mờ của bóng
            spreadRadius: 1.w, // độ lan rộng của bóng
            offset: Offset(0.w, 1.w), // vị trí bóng
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height * 0.12.w,
      width: MediaQuery.of(context).size.width * 0.28.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: CachedNetworkImage(
          imageUrl:
              "https://as2.ftcdn.net/v2/jpg/04/42/54/79/1000_F_442547913_tWYOcGkO06Vbo30KOvrOPte5JqDHVWmR.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
