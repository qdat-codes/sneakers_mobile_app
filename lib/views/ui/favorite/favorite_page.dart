import 'package:flutter/material.dart';
import 'package:sneakers_mobile_app/views/shared/widgets.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Favorite Page',
          style: appstyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
