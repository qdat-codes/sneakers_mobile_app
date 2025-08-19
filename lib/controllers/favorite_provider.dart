import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FavoriteNotifier extends ChangeNotifier {
  final _favBox = Hive.box('fav_box');

  List<dynamic> _ids = [];
  List<dynamic> _favorites = [];
  List<dynamic> _fav = [];

  List<dynamic> get ids => _ids;
  List<dynamic> get favorites => _favorites;
  List<dynamic> get favoriteItems => _fav;

  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  set favorites(List<dynamic> newFavorites) {
    _favorites = newFavorites;
    notifyListeners();
  }

  set favoriteItems(List<dynamic> newFav) {
    _fav = newFav;
    notifyListeners();
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavorites();
  }

  getFavorites() {
    final favData =
        _favBox.keys.map((key) {
          final item = _favBox.get(key);
          return {'key': key, 'id': item['id']};
        }).toList();

    _favorites = favData;
    _ids = _favorites.map((item) => item['id']).toList();
  }

  getAllData() {
    final favData =
        _favBox.keys.map((key) {
          final item = _favBox.get(key);
          return {
            "key": key,
            "id": item['id'],
            "name": item['name'],
            "category": item['category'],
            "price": item['price'],
            "imageUrl": item['imageUrl'],
          };
        }).toList();
    _fav = favData.reversed.toList();
  }

  Future<void> deleteFav(int key) async {
    await _favBox.delete(key);
  }
}
