import 'networking.dart';
import 'package:flutter/material.dart';

const url = 'https://newprod.zypher.co/ebooks/getHome';

class Categories {
  Future<dynamic> getCategories() async {
    NetworkHelper networkHelper = NetworkHelper(url);
  }
}
