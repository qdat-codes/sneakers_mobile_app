import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import '../../controllers/mainscreen_provider.dart';
import 'widgets.dart';

class BottomNavBar extends StatelessWidget {
  final MainScreenNotifier mainScreenNotifier;

  const BottomNavBar({super.key, required this.mainScreenNotifier});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Container(
          padding: EdgeInsets.all(12.r),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 0;
                },
                icon:
                    mainScreenNotifier.pageIndex == 0
                        ? CommunityMaterialIcons.home
                        : CommunityMaterialIcons.home_outline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 1;
                },
                icon:
                    mainScreenNotifier.pageIndex == 1
                        ? Ionicons.search
                        : Ionicons.search_outline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 2;
                },
                icon:
                    mainScreenNotifier.pageIndex == 2
                        ? Ionicons.add_circle
                        : Ionicons.add,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 3;
                },
                icon:
                    mainScreenNotifier.pageIndex == 3
                        ? Ionicons.cart
                        : Ionicons.cart_outline,
              ),
              BottomNavWidget(
                onTap: () {
                  mainScreenNotifier.pageIndex = 4;
                },
                icon:
                    mainScreenNotifier.pageIndex == 4
                        ? Ionicons.person
                        : Ionicons.person_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
