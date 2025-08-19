import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/l10n/app_localizations.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.category, required this.index});

  Category category;
  int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: (index % 2 == 0)
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(category.image),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsetsDirectional.only(
            start: (index % 2 == 0) ? width * 0.02 : 0,
            end: (index % 2 != 0) ? width * 0.02 : 0,
          ),
          width: width * 0.40,
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            borderRadius: BorderRadius.circular(84),
          ),
          child: Row(
            textDirection: (index % 2 == 0)
                ? TextDirection.ltr
                : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.view_all,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  (index % 2 == 0)
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_back_ios_new,
                  color: Theme.of(context).indicatorColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
