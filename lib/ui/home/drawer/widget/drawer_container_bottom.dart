import 'package:flutter/material.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';

class DrawerContainerBottom extends StatelessWidget {
  DrawerContainerBottom({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        border: Border.all(color: AppColors.whiteColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppStyles.medium20White),
          Icon(Icons.arrow_drop_down, color: AppColors.whiteColor, size: 35),
        ],
      ),
    );
  }
}
