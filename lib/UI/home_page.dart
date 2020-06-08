import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zypher/Bloc/CategoryBloc.dart';
import '../Repository/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print('Button pressed');
          },
          iconSize: 30,
        ),
        backgroundColor: Colors.white70,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'What would\nyou like to read,Ariel?',
                style: TextStyle(
                  fontSize: 30,
                  wordSpacing: 2,
                  fontFamily: 'Ariel',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: searchController,
                enabled: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: ' 🔍 title, genre, author',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 0.3),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryIsLoading) {
                    categoryBloc.add(FetchCategory(true));
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoryIsLoaded) {
                    categoryBloc.add(FetchCategory(true));
                    return ShowCategories(state.categoryList);
                  }
                  return Center(
                    child: Text('Error'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowCategories extends StatelessWidget {
  final List<Category> categoryList;
  ShowCategories(this.categoryList);

  @override
  Widget build(BuildContext context) {
    List<Container> tabs = [];
    int n = categoryList.length;
    for (var i = 0; i < n; i++) {
      tabs.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: 0.25 * MediaQuery.of(context).size.width,
          height: 0.20 * MediaQuery.of(context).size.width,
          child: Tab(
            icon: RawMaterialButton(
              child: Container(
                  height: 100, child: Image.network(categoryList[i].imageURL)),
              shape: CircleBorder(),
              onPressed: () {
                print("Button $i pressed");
              },
            ),
            text: categoryList[i].text,
          ),
        ),
      );
    }
    return Container(
      width: double.infinity,
      height: 175,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tabs,
      ),
    );
  }
}
