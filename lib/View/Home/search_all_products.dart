import 'package:flutter/material.dart';
import 'package:second_project/model/product_model.dart';
import 'package:second_project/view/home/Widgets/container_widget.dart';
import 'package:second_project/view/utils/constants/size/sized_box.dart';
import 'package:second_project/view/utils/constants/style/text_style.dart';
import 'package:second_project/view/widgets/text_form_field_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.allProductsList});

  final List<Product> allProductsList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? searchProductList;

  @override
  void initState() {
    searchProductList =
        List.from(widget.allProductsList.cast<Product>().toList());
    super.initState();
  }

  void searchProduct(String value) {
    setState(() {
      searchProductList = widget.allProductsList
          .where((product) =>
              product.productName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                keyboardType: TextInputType.text,
                hintText: 'Search',
                icon: Icon(Icons.search),
                onChanged: (value) {
                  searchProduct(value);
                },
              ),
              kHeight20,
              (searchProductList!.isEmpty)
                  ? Center(
                  child: Text('No products'),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        final product = searchProductList![index];
                        return ContainerWidget(product: product);
                      },
                      itemCount: searchProductList!.length,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
