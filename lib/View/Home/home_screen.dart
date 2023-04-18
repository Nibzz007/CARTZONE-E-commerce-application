import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:second_project/view/Home/Widgets/home_grid_view.dart';
import '../../constants/size/sized_box.dart';
import '../../constants/style/text_style.dart';
import 'Widgets/category_widget.dart';
import 'package:second_project/model/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kGrey300,
      appBar: AppBar(
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute<StatelessWidget>(
        //           builder: (BuildContext context) => BagScreen(),
        //         ),
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.shopping_cart_sharp,
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight20,
                CupertinoSearchTextField(),
                kHeight20,
                Row(
                  children: <Widget>[
                    Text(
                      'Categories',
                      style: categoryStyle,
                    ),
                  ],
                ),
                kHeight20,
                StreamBuilder<List<Category>>(
                  stream: Category.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Something went wrong'),
                      );
                    } else if (snapshot.hasData) {
                      //List<Category> category = [];
                      final categories = snapshot.data!;
                      if (categories.isEmpty) {
                        return Center(
                          child: Text('Empty'),
                        );
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryWidget(
                                title: categories[index].category,
                              );
                            },
                          ),
                        );
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                kHeight20,
                HomeGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
