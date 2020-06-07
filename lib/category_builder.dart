import 'package:flutter/material.dart';
import 'networking.dart';

class BuildCategories {
  List<Container> icons = [];
  List<String> names = [];
  List<String> imageUrls = [];

  Future<dynamic> getCategories() async {
    NetworkHelper networkHelper = NetworkHelper();
    dynamic data = await networkHelper.getData();
    dynamic categories = data['category'];
    for (var category in categories) {
      names.add(category['displayName']);
      imageUrls.add(category['categoryImageURL']);
    }
    print(names);
    print(imageUrls);
    int n = names.length;
    for (var i = 0; i < n; i++) {
      icons.add(
        Container(
          width: 50,
          height: 50,
          child: Tab(
            icon: Image.network(imageUrls[i]),
            text: names[i],
          ),
        ),
      );
    }
    return icons;
  }
}
