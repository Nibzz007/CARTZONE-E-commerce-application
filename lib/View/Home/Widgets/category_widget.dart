import 'package:flutter/material.dart';
import 'package:second_project/view/Home/category_screen.dart';
import 'package:second_project/view/utils/colours/colours.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  final dynamic title;
  final Function()? onTap;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => CategoryScreen(
                    categoryName: widget.title,
                  )
                ),
            ),
          );
        },
        child: Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            color: Colors.deepPurple,
          ),
          child: Center(
            child: Text(
              '${widget.title}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: kWhite,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
