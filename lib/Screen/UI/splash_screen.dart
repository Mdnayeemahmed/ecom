import 'package:ecom/Screen/UI/bottom_nav_bar.dart';
import 'package:ecom/Screen/UI/email_verification.dart';
import 'package:ecom/State_management/userAuthcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/app_colors.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) async {
      final bool loginstate = await Get.find<userAuthcontroller>().isLogin();
      if (loginstate) {
        Get.off(bottomnavbar());
      } else {
        Get.off(emailverification());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Center(
                  child: Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
          )),
          Column(
            children: [
              CircularProgressIndicator(
                color: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Version 1.0',
                  style: TextStyle(
                      color: greyColor, fontSize: 12, letterSpacing: 0.6),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
