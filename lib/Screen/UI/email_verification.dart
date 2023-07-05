import 'package:ecom/Screen/UI/otp_screen.dart';
import 'package:ecom/Screen/utilities/common_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../State_management/login_auth_controller.dart';
import '../widgets/common_button_style.dart';
import '../widgets/common_text_field.dart';

class emailverification extends StatefulWidget {
  const emailverification({Key? key}) : super(key: key);

  @override
  State<emailverification> createState() => _emailverificationState();
}

class _emailverificationState extends State<emailverification> {
  final userauthcontroller _userauthcontroller = Get.put(userauthcontroller());

  final TextEditingController _emailcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<userauthcontroller>(builder: (authcontroller) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Form(
              key: _formkey,
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
                    "Welcome Back",
                    style: titleStyle,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Please Enter Your Email Address",
                    style: subStyle,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  commontextfield(
                    controller: _emailcontroller,
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter A Valid Email';
                      }
                      return null;
                    },
                    hinttext: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  authcontroller.emailverificationprogress
                      ? CircularProgressIndicator()
                      : commonbuttonstyle(
                          tittle: 'Next',
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              bool response = await authcontroller
                                  .emailverification(_emailcontroller.text);
                              if (response == true) {
                                Get.to(otpscreen(
                                  email: _emailcontroller.text,
                                ));
                              } else {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Email Verification Failed Try Again")));
                                }
                              }
                            }
                          },
                        )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
