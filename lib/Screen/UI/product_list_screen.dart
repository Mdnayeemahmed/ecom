import 'package:ecom/Screen/utilities/app_colors.dart';
import 'package:ecom/Screen/widgets/home/product_card.dart';
import 'package:flutter/material.dart';

class productlistscreen extends StatelessWidget {
  const productlistscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        leading: BackButton(
          color: greyColor,
        ),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.7),
          itemCount: 50,
          itemBuilder: (context, index) {
            return product_card();
          }),
    );
  }
}
