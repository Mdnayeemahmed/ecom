import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class appbariconbutton extends StatelessWidget {
  const appbariconbutton({
    super.key, required this.iconData, required this.ontap,
  });

  final IconData iconData;
  final VoidCallback ontap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      splashColor: primaryColor.withOpacity(0.1),


      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          radius: 14,
          child: Icon(iconData,color: softGreyColor,size: 16,),
        ),
      ),
    );
  }
}
