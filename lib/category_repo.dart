import 'package:flutter/material.dart';
import 'networking.dart';
import 'package:zypher/category.dart';
import 'dart:async';

class CategoryRepo {
  List<Category> categoryList = [];

  Future<dynamic> getCategories() async {
    NetworkHelper networkHelper = NetworkHelper();
    dynamic data = await networkHelper.getData();
    dynamic categories = data['category'];
    for (var category in categories) {
      categoryList.add(Category(
          text: category['displayName'],
          imageURL: category['categoryImageURL']));
    }
    return categoryList;
  }
}
