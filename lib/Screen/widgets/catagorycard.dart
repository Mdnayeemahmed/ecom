import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../UI/product_list_screen.dart';
import '../utilities/app_colors.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key,
    required this.name,
    required this.ImageUrl,
  });

  final String name, ImageUrl;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(productlistscreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  ImageUrl,
                  height: 50,
                  width: 50,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: primaryColor,
                  letterSpacing: 0.6),
            ),
          ],
        ),
      ),
    );
  }
}
