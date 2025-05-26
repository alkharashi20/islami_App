import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
import 'package:islamy_app/Moduls/Quran_tap/SuraModel.dart';
import 'package:islamy_app/Moduls/Quran_tap/Quran_details.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Core/Widget/CustomDivider.dart';

class QuranTapView extends StatefulWidget {
  const QuranTapView({super.key});

  @override
  State<QuranTapView> createState() => _QuranTapViewState();
}

class _QuranTapViewState extends State<QuranTapView> {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var theme = Theme.of(context);
    var _loacalization = AppLocalizations.of(context)!;
    return Column(
      children: [
        Image.asset(
          ImageAssets.quran_image,
          scale: 1.1,
        ),
         CustomDivider(),
        Row(
          children: [
            Expanded(
              child: Text(
                _loacalization.verses,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .04,
              child: VerticalDivider(
                color: provider.isDarkMode()
                    ? AppColors.yellowColor
                    : AppColors.primaryLightColor,
                thickness: 3,
              ),
            ),
            Expanded(
              child: Text(
                _loacalization.sura_name,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
         CustomDivider(),
        Expanded(
          child: ListView.builder(
              itemCount: suraNames.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                            "${index + 1}",
                            style: theme.textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          thickness: 3,
                          color: provider.isDarkMode()
                              ? AppColors.yellowColor
                              : AppColors.primaryLightColor,
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, QuranTapDetails.routeName,
                            arguments: SuraItem(suraName: suraNames[index], suraNumber: index  ));
                          },
                          child: Text(
                            suraNames[index],
                            style: theme.textTheme.displayMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
