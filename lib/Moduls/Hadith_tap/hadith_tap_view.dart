import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/Moduls/Hadith_tap/HadithModel.dart';
import 'package:islamy_app/Moduls/Hadith_tap/HaduthDetails.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Core/AppProvider/AppConfigProvider.dart';
import '../../Core/Utlis/AppAssets.dart';
import '../../Core/Widget/CustomDivider.dart';

class HadithTapView extends StatefulWidget {
  const HadithTapView({super.key});

  @override
  State<HadithTapView> createState() => _HadithTapViewState();
}

class _HadithTapViewState extends State<HadithTapView> {
  @override
  List<HadithModel> allHadith = [];

  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var theme = Theme.of(context);
    var _loacalization = AppLocalizations.of(context)!;
    if (allHadith.isEmpty) loadHadith();
    return Column(
      children: [
        Image.asset(
          ImageAssets.hadith_image,
          scale: 1.1,
        ),
        CustomDivider(),
        Text(
          _loacalization.hadith,
          style: theme.textTheme.bodyMedium,
        ),
        CustomDivider(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadithDetails.routeName,
                      arguments: HadithModel(
                        title: allHadith[index].title,
                        content: allHadith[index].content,
                      ));
                },
                child: Text(
                  allHadith[index].title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return CustomDivider(
                thickness: 1,
              );
            },
            itemCount: allHadith.length,
          ),
        )
      ],
    );
  }

  void loadHadith() async {
    String ahadith = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadithList = ahadith.split('#');
    for (int i = 0; i < hadithList.length; i++) {
      String singleHadith = hadithList[i].trim();
      int titleLength = singleHadith.indexOf('\n');
      String title = singleHadith.substring(0, titleLength);
      String content = singleHadith.substring(titleLength + 1);
      HadithModel hadithData = HadithModel(title: title, content: content);
      allHadith.add(hadithData);
    }

    setState(() {});
  }
}
