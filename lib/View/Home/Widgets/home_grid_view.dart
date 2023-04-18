import 'package:flutter/material.dart';
import 'package:second_project/model/product_model.dart';
import 'package:second_project/view/Home/Widgets/container_widget.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Product.getProducts(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data != null) {
          final products = snapshot.data!;
          if (products.isEmpty) {
            return Center(
              child: Text('Product list is empty'),
            );
          } else {
            return GridView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              children: products
                  .map(
                    (value) => ContainerWidget(
                      product: value,
                    ),
                  )
                  .toList(),
            );
          }
        } else {
          return Center(child: Text("Something went wrong"));
        }
      }),
    );
  }
}
