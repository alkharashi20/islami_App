import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/Moduls/Hadith_tap/HadithModel.dart';
import 'package:provider/provider.dart';

import '../../Core/AppProvider/AppConfigProvider.dart';
import '../../Core/Utlis/AppColors.dart';
import '../../Core/Widget/CustomDivider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadithDetails extends StatelessWidget {
  const HadithDetails({super.key});
static const String routeName = '/hadith_details';
  @override
  Widget build(BuildContext context) {
    var arg=ModalRoute.of(context)!.settings.arguments as HadithModel;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                Text(
                  arg.title,
                  style: theme.textTheme.displayMedium,
                ),
                CustomDivider(
                  thickness: 1,
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Text(
                      arg.content,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: 21
                      ),
                    )
                  ],
                ))

              ],
            )
            ,
          )
          ,
        )
    );
  }
}
