import 'package:flutter/material.dart';
import 'category_builder.dart';

List<Container> tabs = [];
void getData() async {
  BuildCategories buildCategories = BuildCategories();
  tabs = await buildCategories.getCategories();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: null,
            iconSize: 30,
          ),
          Text(
            'What would you like to read, Ariel?',
            style: TextStyle(
              fontSize: 30,
              wordSpacing: 2,
              fontFamily: 'Ariel',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextField(
            enabled: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: ' 🔍 title, genre, author',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: tabs,
            ),
          ),
        ],
      ),
    );
  }
}
