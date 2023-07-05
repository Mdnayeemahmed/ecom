import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/Data/model/slider_model.dart';
import 'package:flutter/material.dart';
import '../../utilities/app_colors.dart';

class HomeCarosuelWidget extends StatelessWidget {
  final CategoryModel homesliderModel;
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  HomeCarosuelWidget({super.key, required this.homesliderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _) {
                _currentCarouselIndex.value = index;
              }),
          items: homesliderModel.sliders!.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(slider.image ?? ''))),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: _currentCarouselIndex,
          builder: (context, currentValue, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < (homesliderModel.sliders?.length ?? 0); i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: currentValue == i ? primaryColor : null,
                          border: Border.all(color: greyColor.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
