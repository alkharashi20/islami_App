import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppTheme.dart';
import 'package:islamy_app/Moduls/Hadith_tap/HaduthDetails.dart';
import 'package:islamy_app/Moduls/Quran_tap/Quran_details.dart';
import 'package:islamy_app/Moduls/SplashPage/SplashView.dart';
import 'package:islamy_app/layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const Islami_app()));
}

class Islami_app extends StatelessWidget {
  const Islami_app({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: "isalami App",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: SplashView.routeName,
      locale: Locale(provider.currentLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.currentTheme,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeView.routeName : (context) => const HomeView(),
        QuranTapDetails.routeName : (context) =>const QuranTapDetails(),
        HadithDetails.routeName : (context) => const HadithDetails(),
      },
    );
  }
}
