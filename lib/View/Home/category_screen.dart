import 'package:flutter/material.dart';
import 'package:second_project/model/product_model.dart';
import 'package:second_project/view/Home/Widgets/container_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: Product.getProducts().first,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              List<Product> product = [];
              final products = snapshot.data!;
              if (products.isEmpty) {
                return Center(
                  child: Text('No products'),
                );
              }
              for (var item in products) {
                if (item.category == categoryName) {
                  product.add(item);
                }
              }
              if (products.isEmpty) {
                return Center(
                  child: Text('Category is empty'),
                );
              } else {
                return GridView(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 5),
                  children: product
                      .map(
                        (value) => ContainerWidget(
                          product: value,
                        ),
                      )
                      .toList(),
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          }),
        ),
      ),
    );
  }
}
