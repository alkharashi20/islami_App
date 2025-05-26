import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';
import 'package:islamy_app/Moduls/Hadith_tap/hadith_tap_view.dart';
import 'package:islamy_app/Moduls/Quran_tap/quran_tap_view.dart';
import 'package:islamy_app/Moduls/Radio_tap/radio_tap_view.dart';
import 'package:islamy_app/Moduls/Sebha_tap/sebha_tap_view.dart';
import 'package:islamy_app/Moduls/Setting_tap/setting_tap_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static const String routeName = '/home';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var theme = Theme.of(context);
    var _localization = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                provider.getBackgroundImage(),
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _localization.app_title,
            style: theme.textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(ImageAssets.quran_icon)),
              label: _localization.quran,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(ImageAssets.hadith_icon)),
              label: _localization.hadith,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(ImageAssets.sebha_icon)),
              label: _localization.sebha,
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage(ImageAssets.radio_icon)),
              label: _localization.radio,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: _localization.setting,
            ),
          ],
        ),
        body: taps[selectedIndex],
      ),
    );
  }

  List<Widget> taps = const [
    QuranTapView(),
    HadithTapView(),
    SebhaTapView(),
    RadioTapView(),
    SettingTapView()
  ];
}
