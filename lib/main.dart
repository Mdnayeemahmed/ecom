import 'package:ecom/State_management/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screen/UI/splash_screen.dart';
import 'Screen/utilities/app_colors.dart';
import 'State_management/bottom_bar_nav_controller.dart';
import 'State_management/catagory_controller.dart';
import 'State_management/login_auth_controller.dart';
import 'State_management/product_by_remark_controller.dart';
import 'State_management/userAuthcontroller.dart';
import 'State_management/user_profile_controller.dart';

void main() {
  GetxBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: splash_screen(),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 1,
              titleTextStyle: TextStyle(
                  color: greyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18))),
    );
  }
}

class GetxBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottombarNavController());
    Get.put(userAuthcontroller());
    Get.put(UserProfileController());
    Get.put(homeSliderController());
    Get.put(catagoryController());
    Get.put(ProductByRemarkController());



  }
}
