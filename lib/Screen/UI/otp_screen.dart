import 'package:ecom/Screen/UI/bottom_nav_bar.dart';
import 'package:ecom/Screen/UI/home_screen.dart';
import 'package:ecom/Screen/UI/sign_up_screen.dart';
import 'package:ecom/State_management/userAuthcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../State_management/login_auth_controller.dart';
import '../utilities/app_colors.dart';
import '../utilities/common_style.dart';
import '../widgets/common_button_style.dart';

class otpscreen extends StatefulWidget {
  final String email;

  const otpscreen({Key? key, required this.email}) : super(key: key);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  final userauthcontroller _userauthcontroller = Get.put(userauthcontroller());

  final TextEditingController _otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<userauthcontroller>(builder: (authcontroller) {
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  "Enter OTP Code",
                  style: titleStyle,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "A 4 digit otp has been sent",
                  style: subStyle,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 16,
                ),
                PinCodeTextField(
                  length: 4,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  controller: _otpcontroller,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.green,
                      activeColor: primaryColor,
                      inactiveColor: primaryColor,
                      inactiveFillColor: Colors.white),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  appContext: context,
                ),
                authcontroller.otpverificationprogress
                    ? CircularProgressIndicator()
                    : commonbuttonstyle(
                        tittle: 'Next',
                        onTap: () async{
                            bool response = await authcontroller
                                .otpverification(widget.email,_otpcontroller.text);
                            if (response == true) {

                              Get.to(Get.offAll(const homescreen()));
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "OTP Verification Failed Try Again")));
                              }
                            }


                          //Get.off(bottomnavbar());
                        },
                      ),
                SizedBox(
                  height: 16,
                ),
                RichText(
                    text: TextSpan(
                        text: "This code will expire in ",
                        style: TextStyle(fontSize: 12, color: softGreyColor),
                        children: [
                      TextSpan(
                          text: '120s',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.w600))
                    ])),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend Code",
                      style: TextStyle(color: greyColor.withOpacity(0.6)),
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
