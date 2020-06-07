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
//    print(names);
//    print(imageUrls);
    int n = names.length;
    for (var i = 0; i < n; i++) {
      icons.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: 100,
          height: 100,
          child: Tab(
            icon: IconButton(
              icon: Image.network(imageUrls[i]),
              iconSize: 100,
              onPressed: () {
                print("Button $i pressed");
              },
            ),
            text: names[i],
          ),
        ),
      );
    }
    return icons;
  }
}
