import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zypher/Bloc/CategoryBloc.dart';
import '../Repository/category.dart';
import '../Repository/category_repo.dart';

//void getData() async {
//  CategoryRepo buildCategories = CategoryRepo();
//  tabs = await buildCategories.getCategories();
//}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
//    getData();
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'What would you like to read,Ariel?',
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
                    return CircularProgressIndicator();
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
          width: 100,
          height: 100,
          child: Tab(
            icon: IconButton(
              icon: Image.network(categoryList[i].imageURL),
              iconSize: 100,
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
