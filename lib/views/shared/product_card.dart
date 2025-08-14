import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sneakers_mobile_app/views/shared/appstyle.dart';
import 'package:sneakers_mobile_app/views/ui/widgets.dart';

import '../../config/contants/contants.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.category,
    required this.id,
    required this.price,
    required this.imageUrl,
    required this.isColor,
  });

  final String name;
  final String category;
  final String id;
  final String price;
  final String imageUrl;
  final bool isColor;

  @override
  State<ProductCard> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCard> {
  final _favBox = Hive.box('fav_box');

  Future<void> _createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavorites();
  }

  getFavorites() {
    final favData =
        _favBox.keys.map((key) {
          final item = _favBox.get(key);
          return {'key': key, 'id': item['id']};
        }).toList();

    favor = favData;
    ids = favor.map((item) => item['id']).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 0.w, 20.w, 0.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.55.w,
          height: MediaQuery.of(context).size.height.h,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0.6.w,
                spreadRadius: 1.w,
                offset: Offset(0.w, 1.w),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.w,
                    child: GestureDetector(
                      onTap: () async {
                        if (ids.contains(widget.id)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FavoritePage(),
                            ),
                          );
                        } else {
                          await _createFav({
                            'id': widget.id,
                            'name': widget.name,
                            'category': widget.category,
                            'price': widget.price,
                            'imageUrl': widget.imageUrl,
                          });
                        }
                      },
                      child:
                          ids.contains(widget.id)
                              ? const Icon(
                                CommunityMaterialIcons.heart,
                                color: Colors.red,
                              )
                              : const Icon(
                                CommunityMaterialIcons.heart_outline,
                                color: Colors.black,
                              ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appstyleWithHt(
                        24,
                        Colors.black,
                        FontWeight.bold,
                        1.1,
                      ),
                    ),
                    Text(
                      widget.category,
                      style: appstyleWithHt(
                        18,
                        Colors.grey,
                        FontWeight.bold,
                        1.1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' \$${widget.price}',
                      style: appstyle(30, Colors.black, FontWeight.w600),
                    ),
                    widget.isColor
                        ? Row(
                          children: [
                            Text(
                              "Colors",
                              style: appstyle(18, Colors.grey, FontWeight.w500),
                            ),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 30.w,
                              child: ChoiceChip(
                                label: Text(""),
                                selected: selected,
                                visualDensity: VisualDensity.compact,
                                selectedColor: Colors.black,
                                shape: const StadiumBorder(),
                              ),
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
