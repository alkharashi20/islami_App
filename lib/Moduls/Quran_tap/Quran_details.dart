import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
import 'package:islamy_app/Core/Widget/CustomDivider.dart';
import 'package:islamy_app/Moduls/Quran_tap/SuraModel.dart';
import 'package:provider/provider.dart';

import '../../Core/AppProvider/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTapDetails extends StatefulWidget {
  const QuranTapDetails({super.key});

  static const String routeName = 'Quran Tap Details';

  @override
  State<QuranTapDetails> createState() => _QuranTapDetailsState();
}

class _QuranTapDetailsState extends State<QuranTapDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as SuraItem;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AppConfigProvider>(context);
    var theme = Theme.of(context);
    var _localization = AppLocalizations.of(context)!;
    if (verses.isEmpty) loadFiles(arg.suraNumber);
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
          body: Container(
            width: width,
            height: height,
            margin: EdgeInsets.only(
                right: width * .08,
                left: width * .08,
                bottom: height * .1,
                top: height * .05),
            padding: EdgeInsets.only(
                top: height * .04,
                bottom: height * .02,
                left: width * .1,
                right: width * .1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: provider.isDarkMode()
                    ? AppColors.primaryDarkColor
                    : AppColors.whiteColor,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    provider.isDarkMode()
                        ? AppColors.primaryDarkColor.withOpacity(.6)
                        : AppColors.whiteColor.withOpacity(.6),
                    provider.isDarkMode()
                        ? AppColors.primaryDarkColor
                        : AppColors.whiteColor,
                    provider.isDarkMode()
                        ? AppColors.primaryDarkColor
                        : AppColors.whiteColor,
                    provider.isDarkMode()
                        ? AppColors.primaryDarkColor
                        : AppColors.whiteColor,
                  ],
                )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "سوره ${arg.suraName}",
                      style: theme.textTheme.displayMedium,
                    ),
                    ImageIcon(
                      const AssetImage(ImageAssets.play_icon),
                      color: provider.isDarkMode()
                          ? AppColors.yellowColor
                          : AppColors.blackColor,
                    ),
                  ],
                ),
                CustomDivider(
                  thickness: 1,
                ),
                verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.primaryLightColor,
                        ),
                      )
                    : Expanded(
                        child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return CustomDivider(
                                thickness: .1,
                              );
                            },
                            itemCount: verses.length,
                            itemBuilder: (context, index) {
                              return Text(
                                "${verses[index].trim()} (${index + 1})",
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.displayMedium
                                    ?.copyWith(fontSize: 22),
                              );
                            }),
                      )
              ],
            ),
          ),
        ));
  }

  void loadFiles(int index) async {
    String suraContent =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    verses = suraContent.split('\n');
    setState(() {});
  }
}
