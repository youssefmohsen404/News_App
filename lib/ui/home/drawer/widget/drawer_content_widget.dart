import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';

class DrawerContentWidget extends StatelessWidget {
  DrawerContentWidget({super.key, required this.icon, required this.text});

  Icon icon;
  String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        icon,
        SizedBox(width: width * 0.02),
        Text(text, style: AppStyles.bold20White),
      ],
    );
  }
}
