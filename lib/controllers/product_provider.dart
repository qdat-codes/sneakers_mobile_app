import 'package:flutter/material.dart';
import 'package:sneakers_mobile_app/models/product/product_model.dart';
import 'package:sneakers_mobile_app/services/product_service.dart';

class ProductNotifier extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

  late Future<List<ProductModel>> menProducts;
  late Future<List<ProductModel>> womenProducts;
  late Future<List<ProductModel>> kidProducts;
  late Future<ProductModel> product;

  int get activePage => _activePage;

  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;

  set shoeSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index) {
    _shoeSizes =
        _shoeSizes.asMap().entries.map((entry) {
          final i = entry.key;
          final sizeOption = entry.value;

          if (i == index) {
            return sizeOption.copyWith(isSelected: !sizeOption.isSelected);
          } else {
            return sizeOption;
          }
        }).toList();
    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }

  void clearAllSizes() {
    try {
      _shoeSizes =
          _shoeSizes.map((sizeOption) {
            return sizeOption.copyWith(isSelected: false);
          }).toList();
    } catch (e) {
      _shoeSizes = [];
    }
    notifyListeners();
  }

  void clearAllProducts() {
    try {
      _sizes.clear();
      _shoeSizes.clear();
      _activePage = 0;
    } catch (e) {
      _sizes = [];
      _shoeSizes = [];
      _activePage = 0;
    }
    notifyListeners();
  }

  void getShoes(String category, String id) {
    if (category == "men") {
      product = ProductService().fetchMenProductsById(id);
    } else if (category == "women") {
      product = ProductService().fetchWomenProductsById(id);
    } else {
      product = ProductService().fetchKidProductsById(id);
    }
  }
}
