import 'package:flutter/material.dart';

import '../../../Colours/colours.dart';

class CategoryWidget extends StatelessWidget {
   const CategoryWidget({
    super.key,
   required  this.title
  });
  final String title;
  //bool ontap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   ontap = true;
      // },
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          //color: hello(),
          border: Border.all(color: kBlack38),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(child: Text(title)),
      ),
    );
  }

  // Color hello() {
  //   if(ontap == true){
  //     return kBlue;
  //   }else{
  //     return kWhite;
  //   }
  // }
}
