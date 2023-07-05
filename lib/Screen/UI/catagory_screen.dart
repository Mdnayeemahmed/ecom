import 'package:ecom/Screen/utilities/app_colors.dart';
import 'package:ecom/State_management/catagory_controller.dart';
import 'package:ecom/State_management/catagory_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../State_management/bottom_bar_nav_controller.dart';
import '../widgets/catagorycard.dart';

class catagoryscreen extends StatelessWidget {
  const catagoryscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Catagories"),
          leading: IconButton(
            onPressed: () {
              final BottombarNavController bottombarNavController =
                  Get.put(BottombarNavController());
              bottombarNavController.backtohome();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: greyColor,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<catagoryController>(builder: (CatagoryController) {
            if (CatagoryController.getsliderprogress) {
              return Center(child: CircularProgressIndicator());
            }

            return RefreshIndicator(
              onRefresh: () async {
                Get.find<catagoryController>().getcatagorymodel();
              },
              child: GridView.builder(
                  itemCount:
                      CatagoryController.catagoryModel.catagories!.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    final catagory =
                        CatagoryController.catagoryModel.catagories![index];
                    return CatagoryCard(
                      name: catagory.categoryName.toString(),
                      ImageUrl: catagory.categoryImg.toString(),
                    );
                  }),
            );
          }),
        ));
  }
}
