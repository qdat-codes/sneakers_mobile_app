import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.onPress,
    required this.label,
    required this.btnColor,
  });

  final VoidCallback onPress;
  final String label;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.w,
            color: btnColor,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        width: MediaQuery.of(context).size.width * 0.25.w,
        child: Center(
          child: Text(
            label,
            style: appstyle(20.sp, btnColor, FontWeight.w600),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
