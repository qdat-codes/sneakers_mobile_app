import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:sneakers_mobile_app/config/components/cached_network_image.dart';
import 'package:sneakers_mobile_app/controllers/favorite_provider.dart';
import 'package:sneakers_mobile_app/views/shared/widgets.dart';
import 'package:sneakers_mobile_app/views/ui/mainscreen.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    var favoritesNotifier = Provider.of<FavoriteNotifier>(
      context,
      listen: true,
    );
    favoritesNotifier.getAllData();
    List<dynamic> fav = favoritesNotifier.favoriteItems;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 15.w, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top_image.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Text(
                "My Favorites",
                style: appstyle(40, Colors.white, FontWeight.bold),
              ),
            ),
            Padding(padding: EdgeInsets.all(8.w)),
            ListView.builder(
              itemCount: fav.length,
              padding: EdgeInsets.only(top: 100.w),
              itemBuilder: (context, index) {
                final shoe = fav[index];
                return Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            spreadRadius: 5,
                            blurRadius: 0.3,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(12.w),
                                  child: CustomCachedNetworkImage(
                                    imageUrl: shoe['imageUrl'],
                                    boxFit: BoxFit.fill,
                                    width: 70.w,
                                    height: 70.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 12.w),
                                  child: Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          shoe['name'],
                                          style: appstyle(
                                            16,
                                            Colors.black,
                                            FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          shoe['category'],
                                          style: appstyle(
                                            14,
                                            Colors.grey,
                                            FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$${shoe['price']}',
                                              style: appstyle(
                                                18,
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
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: GestureDetector(
                              onTap: () {
                                favoritesNotifier.deleteFav(shoe['key']);
                                favoritesNotifier.ids.removeWhere(
                                  (element) => element == shoe['id'],
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MainScreen(),
                                  ),
                                );
                              },
                              child: Icon(Ionicons.heart_dislike_outline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
