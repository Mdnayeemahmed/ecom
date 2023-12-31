import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';

class productdetailscarousel extends StatelessWidget {
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _) {
                _currentCarouselIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.2),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ValueListenableBuilder(
                valueListenable: _currentCarouselIndex,
                builder: (context, currentValue, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i <= 5; i++)
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: currentValue == i
                                    ? primaryColor
                                    : Colors.white,
                                border: Border.all(
                                    color: greyColor.withOpacity(.5)),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
