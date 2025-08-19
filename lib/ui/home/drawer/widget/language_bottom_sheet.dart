import 'package:flutter/material.dart';
import 'package:news/provider/language_provider.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
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
            //todo:change language to arabic
            onTap: () {
              languageProvider.changeLanguage('ar');
              setState(() {});
            },

            child: languageProvider.language == 'ar'
                ? selectedTheme(AppLocalizations.of(context)!.arabic)
                : unSelectedTheme(AppLocalizations.of(context)!.arabic),
          ),

          SizedBox(height: height * 0.04),

          InkWell(
            //todo: change language to english
            onTap: () {
              languageProvider.changeLanguage('en');
              setState(() {});
            },
            child: languageProvider.language == 'en'
                ? selectedTheme(AppLocalizations.of(context)!.english)
                : unSelectedTheme(AppLocalizations.of(context)!.english),
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
