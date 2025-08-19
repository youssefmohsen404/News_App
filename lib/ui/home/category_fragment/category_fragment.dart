import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/ui/home/category_fragment/widget/category_item.dart';
import 'package:provider/provider.dart';
import 'package:news/l10n/app_localizations.dart';

typedef OnCategoryItemOnClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.onCategoryItemOnClick});

  OnCategoryItemOnClick onCategoryItemOnClick;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var categoriesList = Category.getCategoriesList(
      themeProvider.themeMode == ThemeMode.dark ? false : true,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.good_morning,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            AppLocalizations.of(context)!.some_news,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: // todo: click using call back funtion
                  () {
                    onCategoryItemOnClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
