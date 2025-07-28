import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  final String imageUrl;
  final String name;
  final String price;
  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: widget.imageUrl, fit: BoxFit.fill),
            Container(
              padding: EdgeInsets.only(top: 12.h),
              height: 70.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    widget.name,
                    style: appstyleWithHt(20, Colors.black, FontWeight.w700, 1),
                  ),
                  Text(
                    widget.price,
                    style: appstyleWithHt(16, Colors.grey, FontWeight.w500, 1),
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
