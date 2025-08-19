import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:news/ui/home/category%20details/category_details.dart';
import 'package:news/ui/home/category_fragment/category_fragment.dart';
import 'package:news/ui/home/category_fragment/widget/category_item.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_styles.dart';
import 'package:news/model/category.dart';
import 'package:news/l10n/app_localizations.dart';

import '../../model/NewsResponse.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //todo: open text field
              Navigator.pushNamed(context, AppRoutes.searchRouteName);
            },
            icon: Icon(Icons.search),
          ),
        ],

        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(child: HomeDrawer(drawerItemClick: drawerItemClick)),

      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemOnClick: onCategoryItemOnClick)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  Category? selectedCategory;

  void onCategoryItemOnClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void drawerItemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
