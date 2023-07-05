import 'package:ecom/Screen/UI/otp_screen.dart';
import 'package:ecom/Screen/utilities/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilities/common_style.dart';
import '../widgets/common_button_style.dart';
import '../widgets/common_text_field.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({Key? key}) : super(key: key);

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    width: 80,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Complete Profile",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Get started with us with your details",
                    style: subStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commontextfield(
                    controller: TextEditingController(),
                    validator: (String? value) {},
                    hinttext: 'First Name',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commontextfield(
                    controller: TextEditingController(),
                    validator: (String? value) {},
                    hinttext: 'Last Name',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commontextfield(
                    controller: TextEditingController(),
                    validator: (String? value) {},
                    hinttext: 'Mobile',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commontextfield(
                    controller: TextEditingController(),
                    validator: (String? value) {},
                    hinttext: 'City',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commontextfield(
                    controller: TextEditingController(),
                    validator: (String? value) {},
                    hinttext: 'Shipping Address',
                    maxline: 3,
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  commonbuttonstyle(
                    tittle: 'Complete',
                    onTap: () {
                      //Get.to();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
