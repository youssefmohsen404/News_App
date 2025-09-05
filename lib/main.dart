import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/provider/language_provider.dart';
import 'package:news/provider/theme_provider.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/ui/search/search_screen.dart';
import 'package:news/utils/app_routes.dart';
import 'package:news/utils/app_theme.dart';
import 'package:news/utils/cubit_observer.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.searchRouteName: (context) => SearchScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: Locale(languageProvider.language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
