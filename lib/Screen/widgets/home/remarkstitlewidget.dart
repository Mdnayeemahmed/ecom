import 'package:flutter/material.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/common_style.dart';

class RemarkTitleWidget extends StatelessWidget {
  const RemarkTitleWidget({
    super.key,
    required this.remarkname,
    required this.onTapSellAll,
  });

  final String remarkname;
  final VoidCallback onTapSellAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarkname,
          style: titleStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        TextButton(
            onPressed: onTapSellAll,
            child: Text(
              "See All",
              style: TextStyle(color: primaryColor),
            ))
      ],
    );
  }
}
