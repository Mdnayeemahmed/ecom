import 'package:ecom/Screen/UI/cart_screen.dart';
import 'package:ecom/Screen/UI/catagory_screen.dart';
import 'package:ecom/Screen/UI/home_screen.dart';
import 'package:ecom/Screen/UI/wishlist_screen.dart';
import 'package:ecom/Screen/utilities/app_colors.dart';
import 'package:ecom/State_management/catagory_controller.dart';
import 'package:ecom/State_management/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../State_management/bottom_bar_nav_controller.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({Key? key}) : super(key: key);

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  final BottombarNavController _bottombarNavController =
      Get.put(BottombarNavController());

  List<Widget> _screens = [
    homescreen(),
    catagoryscreen(),
    cartscreen(),
    wishlistscreen()
  ];

  @override
  void initState() {
    Get.find<homeSliderController>().gethomeslider();
    Get.find<catagoryController>().getcatagorymodel();
    Get.find<catagoryController>().getcatagorymodel();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottombarNavController>(
        builder: (controller) {
          return _screens[controller.selectedindex];
        }
      ),
      bottomNavigationBar: GetBuilder<BottombarNavController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value) {
              controller.Changeindex(value);
            },
            currentIndex: controller.selectedindex,
            selectedItemColor: primaryColor,
            unselectedItemColor: greyColor,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(color: softGreyColor),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view), label: "Catagory"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist")
            ],
          );
        }
      ),
    );
  }
}
