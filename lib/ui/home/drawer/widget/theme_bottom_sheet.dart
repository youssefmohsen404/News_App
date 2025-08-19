import 'package:flutter/material.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'package:news/l10n/app_localizations.dart';

class ThemeBottomSheet extends StatefulWidget {
  ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(20),
        color: AppColors.greyColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            //todo:change theme to dark
            onTap: () {
              themeProvider.changeTheme(ThemeMode.dark);
              setState(() {});
            },

            child: themeProvider.themeMode == ThemeMode.dark
                ? selectedTheme(AppLocalizations.of(context)!.dark_mode)
                : unSelectedTheme(AppLocalizations.of(context)!.dark_mode),
          ),

          SizedBox(height: height * 0.04),

          InkWell(
            //todo: change theme to light
            onTap: () {
              themeProvider.changeTheme(ThemeMode.light);
              setState(() {});
            },
            child: themeProvider.themeMode == ThemeMode.light
                ? selectedTheme(AppLocalizations.of(context)!.light_mode)
                : unSelectedTheme(AppLocalizations.of(context)!.light_mode),
          ),
        ],
      ),
    );
  }

  Widget selectedTheme(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.bold24Black),
        Icon(Icons.done, color: AppColors.blackColor, size: 40),
      ],
    );
  }

  Widget unSelectedTheme(String text) {
    return Text(text, style: AppStyles.bold20Black);
  }
}
