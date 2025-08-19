import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/ui/home/drawer/widget/drawer_container_bottom.dart';
import 'package:news/ui/home/drawer/widget/drawer_content_widget.dart';
import 'package:news/ui/home/drawer/widget/language_bottom_sheet.dart';
import 'package:news/ui/home/drawer/widget/theme_bottom_sheet.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:news/l10n/app_localizations.dart';

import '../../../provider/language_provider.dart';

class HomeDrawer extends StatefulWidget {
  VoidCallback drawerItemClick;

  HomeDrawer({super.key, required this.drawerItemClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: height * 0.20,
            color: AppColors.whiteColor,
            child: Text("News App", style: AppStyles.bold24Black),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: width * 0.02,
              vertical: height * 0.02,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    //todo: go to home
                    widget.drawerItemClick();
                  },
                  child: DrawerContentWidget(
                    icon: Icon(
                      CupertinoIcons.home,
                      color: AppColors.whiteColor,
                    ),
                    text: AppLocalizations.of(context)!.go_to_home,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Divider(
                  indent: width * 0.04,
                  endIndent: width * 0.04,
                  thickness: 2,
                ),
                SizedBox(height: height * 0.02),

                DrawerContentWidget(
                  icon: Icon(
                    Icons.format_paint_outlined,
                    color: AppColors.whiteColor,
                  ),
                  text: AppLocalizations.of(context)!.theme,
                ),
                SizedBox(height: height * 0.01),

                InkWell(
                  //todo: open theme bottom sheet
                  onTap: () {
                    showThemeBottomSheet();
                  },
                  child: DrawerContainerBottom(
                    text: themeProvider.themeMode == ThemeMode.dark
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                  ),
                ),
                SizedBox(height: height * 0.02),

                Divider(
                  indent: width * 0.04,
                  endIndent: width * 0.04,
                  thickness: 2,
                ),
                SizedBox(height: height * 0.02),
                DrawerContentWidget(
                  icon: Icon(
                    Icons.language_outlined,
                    color: AppColors.whiteColor,
                  ),
                  text: AppLocalizations.of(context)!.language,
                ),
                SizedBox(height: height * 0.01),

                InkWell(
                  //todo:open language bottom sheet
                  onTap: () {
                    showLanguageBottomSheet();
                  },
                  child: DrawerContainerBottom(
                    text: languageProvider.language == 'en'
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }
}
