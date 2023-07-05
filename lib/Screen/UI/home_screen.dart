import 'package:ecom/Screen/UI/email_verification.dart';
import 'package:ecom/Screen/UI/sign_up_screen.dart';
import 'package:ecom/Screen/utilities/app_colors.dart';
import 'package:ecom/State_management/home_slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Data/model/catagory_model.dart';
import '../../State_management/bottom_bar_nav_controller.dart';
import '../../State_management/catagory_controller.dart';
import '../../State_management/userAuthcontroller.dart';
import '../widgets/appbariconbutton.dart';
import '../widgets/catagorycard.dart';
import '../widgets/home/home_carousel_widget.dart';
import '../widgets/home/product_card.dart';
import '../widgets/home/remarkstitlewidget.dart';
import '../widgets/home/search_text_field.dart';

class homescreen extends StatelessWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            Spacer(),
            appbariconbutton(
              iconData: Icons.person,
              ontap: () {
                Get.find<userAuthcontroller>().isLogin().then((value) {
                  if (value) {
                    Get.to(signupscreen());
                  } else {
                    Get.to(emailverification());
                  }
                });
              },
            ),
            appbariconbutton(
              iconData: Icons.call,
              ontap: () {},
            ),
            appbariconbutton(
              iconData: Icons.notifications_none,
              ontap: () {},
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(),
              SizedBox(
                height: 16,
              ),
              GetBuilder<homeSliderController>(builder: (homeSliderController) {
                if (homeSliderController.getsliderprogress) {
                  return SizedBox(
                      height: 180,
                      child: Center(child: CircularProgressIndicator()));
                }
                return HomeCarosuelWidget(
                  homesliderModel: homeSliderController.homeSliderModel,
                );
              }),
              SizedBox(
                height: 8,
              ),
              RemarkTitleWidget(
                remarkname: 'Catagories',
                onTapSellAll: () {
                  Get.find<BottombarNavController>().Changeindex(1);
                },
              ),
              SizedBox(
                height: 8,
              ),
              GetBuilder<catagoryController>(builder: (catagoryController) {
                if (catagoryController.getsliderprogress) {
                  return SizedBox(
                    height: 90,
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: catagoryController.catagoryModel.catagories!
                          .map((e) => CatagoryCard(
                                name: e.categoryName.toString(),
                                ImageUrl: e.categoryImg.toString(),
                              ))
                          .toList()),
                );
              }),
              SizedBox(
                height: 8,
              ),
              RemarkTitleWidget(
                remarkname: 'Popular',
                onTapSellAll: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    product_card(),
                    product_card(),
                    product_card(),
                    product_card(),
                    product_card(),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RemarkTitleWidget(
                remarkname: 'Special',
                onTapSellAll: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    product_card(),
                    product_card(),
                    product_card(),
                    product_card(),
                    product_card(),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              RemarkTitleWidget(
                remarkname: 'New',
                onTapSellAll: () {},
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    product_card(),
                    product_card(),
                    product_card(),
                    product_card(),
                    product_card(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
