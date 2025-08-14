import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width = 70,
    this.height = 70,
    this.borderRadius = 3,
    this.iconSize = 12,
    required this.boxFit,
  });

  final String imageUrl;
  final double width;
  final double height;
  final double borderRadius;
  final double iconSize;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: imageUrl.isEmpty ? _buildEmptyContainer() : _buildNetworkImage(),
    );
  }

  Widget _buildEmptyContainer() {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius.r)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.image_not_supported,
            size: iconSize,
            color: Colors.grey.shade600,
          ),
          Text(
            'Image not available',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkImage() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width.w,
      height: height.h,
      fit: boxFit,
      placeholder:
          (context, url) => Container(
            width: width.w,
            height: height.h,
            color: Colors.grey.shade300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade600),
              ),
            ),
          ),
      errorWidget: (context, url, error) => _buildEmptyContainer(),
    );
  }
}
