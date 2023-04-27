import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_project/model/product_model.dart';
import 'package:second_project/view/Home/Widgets/home_grid_view.dart';
import 'package:second_project/view/home/search_all_products.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import 'widgets/category_widget.dart';
import 'package:second_project/model/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          toolbarHeight: 70,
          title: Text(
            'CARTZONE',
            style: GoogleFonts.eczar(
                fontSize: 26, fontWeight: FontWeight.w500, letterSpacing: 10),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight20,
                GestureDetector(
                  onTap: (() async {
                    List<Product> allProductsList =
                        await Product.getProducts().first;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SearchScreen(
                              allProductsList: allProductsList,
                            )),
                      ),
                    );
                  }),
                  child: Container(
                    width: double.infinity,
                    height: 36,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.2),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300),
                    child: Row(
                      children: [
                        kWidth10,
                        Icon(
                          Icons.search,
                        ),
                        kWidth10,
                        Text(
                          'Search for products',
                          style: TextStyle(
                              fontWeight: FontWeight.w200, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
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
