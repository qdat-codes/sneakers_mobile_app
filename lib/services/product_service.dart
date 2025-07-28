import 'dart:convert';

import 'package:flutter/services.dart' as the_bundle;
import 'package:sneakers_mobile_app/models/product/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchMenProducts() async {
    final data = await the_bundle.rootBundle.loadString(
      'assets/data/json/men.json',
    );
    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<List<ProductModel>> fetchWomenProducts() async {
    final data = await the_bundle.rootBundle.loadString(
      'assets/data/json/women.json',
    );
    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<List<ProductModel>> fetchKidProducts() async {
    final data = await the_bundle.rootBundle.loadString(
      'assets/data/json/kid.json',
    );
    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  // get by id
  Future<ProductModel> fetchMenProductsById(String id) async {
    final data = await the_bundle.rootBundle.loadString(
      'assets/data/json/men.json',
    );
    final List<dynamic> jsonList = jsonDecode(data);
    final List<ProductModel> products =
        jsonList.map((json) => ProductModel.fromJson(json)).toList();
    return products.firstWhere((product) => product.id == id);
  }

  Future<ProductModel> fetchWomenProductsById(String id) async {
    final data = await the_bundle.rootBundle.loadString(
      'assets/data/json/women.json',
    );
    final List<dynamic> jsonList = jsonDecode(data);
    final List<ProductModel> products =
        jsonList.map((json) => ProductModel.fromJson(json)).toList();
    return products.firstWhere((product) => product.id == id);
  }

  Future<ProductModel> fetchKidProductsById(String id) async {
    final data = await the_bundle.rootBundle.loadString(
      'assets/data/json/kid.json',
    );
    final List<dynamic> jsonList = jsonDecode(data);
    final List<ProductModel> products =
        jsonList.map((json) => ProductModel.fromJson(json)).toList();
    return products.firstWhere((product) => product.id == id);
  }
}
