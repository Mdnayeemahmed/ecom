import 'package:ecom/Screen/utilities/common_style.dart';
import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';
import '../widgets/common_button_style.dart';
import '../widgets/product_details/product_details_carousel.dart';
import '../widgets/product_stepper.dart';

class productdetailsscreen extends StatefulWidget {
  const productdetailsscreen({Key? key}) : super(key: key);

  @override
  State<productdetailsscreen> createState() => _productdetailsscreenState();
}

class _productdetailsscreenState extends State<productdetailsscreen> {
  List<Color> colors = const [
    Color(0xFF000000),
    Color(0xFF7B2828),
    Color(0xFF251497),
    Color(0xFF08781A),
    Color(0xFF7E0472),
  ];

  List<String> sizes = const [
    'S',
    'L',
    'XL',
    'XXL',
    'XXXL',
  ];

  Color _selectedColor = Color(0xFF000000);
  String _selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        leading: BackButton(
          color: greyColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                productdetailscarousel(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Nike Casual Shoes A5457',
                                        style:
                                            titleStyle.copyWith(fontSize: 18)),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    productstepper()
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 14,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: softGreyColor),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Reviews",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: primaryColor),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.favorite_border,
                                                size: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text("Colors",
                                    style: titleStyle.copyWith(
                                        fontSize: 20,
                                        color: greyColor,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: colors.map((color) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          if (_selectedColor != color) {
                                            _selectedColor = color;
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          }
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: color,
                                          radius: 15,
                                          child: Visibility(
                                            visible: color == _selectedColor,
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text("Sizes",
                                    style: titleStyle.copyWith(
                                        fontSize: 20,
                                        color: greyColor,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: sizes.map((size) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          if (_selectedSize != size) {
                                            _selectedSize = size;
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              border:
                                                  Border.all(color: greyColor),
                                              color: size == _selectedSize
                                                  ? primaryColor
                                                  : null),
                                          child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text(
                                              size,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: size == _selectedSize
                                                      ? Colors.white
                                                      : null),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: greyColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: softGreyColor,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: softGreyColor),
                      ),
                      Text(
                        "\$100",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: primaryColor),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: SizedBox(
                    width: 120,
                    child: commonbuttonstyle(
                      tittle: 'Add To Cart',
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
