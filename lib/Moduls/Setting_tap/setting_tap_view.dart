import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTapView extends StatefulWidget {
  const SettingTapView({super.key});

  @override
  State<SettingTapView> createState() => _SettingTapViewState();
}

class _SettingTapViewState extends State<SettingTapView> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var provider = Provider.of<AppConfigProvider>(context);
    var localizations = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<String> _languages = [localizations.english, localizations.arabic];
    List<String> _modes = [localizations.light, localizations.dark];
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: height * .12, horizontal: width * .06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localizations.language,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            height: height * .02,
          ),
          CustomDropdown<String>(
              hintText: "Select your language",
              decoration: CustomDropdownDecoration(
                  closedFillColor: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.whiteColor,
                  expandedFillColor: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.whiteColor,
                  closedSuffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: provider.isDarkMode()
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  )),
              items: _languages,
              initialItem: provider.currentLanguage == "en"
                  ? _languages[0]
                  : _languages[1],
              onChanged: (value) {
                if (value == _languages[0]) {
                  provider.changeLanguage("en");
                }
                if (value == _languages[1]) {
                  provider.changeLanguage("ar");
                }
              }),
          SizedBox(
            height: height * .04,
          ),
          Text(
            localizations.mode,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            height: height * .015,
          ),
          CustomDropdown<String>(
              hintText: "Select your theme",
              decoration: CustomDropdownDecoration(
                  closedFillColor: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.whiteColor,
                  expandedFillColor: provider.isDarkMode()
                      ? AppColors.primaryDarkColor
                      : AppColors.whiteColor,
                  closedSuffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: provider.isDarkMode()
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  )),
              items: _modes,
              initialItem: provider.currentTheme == ThemeMode.light
                  ? _modes[0]
                  : _modes[1],
              onChanged: (value) {
                if (value == _modes[0]) {
                  provider.changeTheme(ThemeMode.light);
                }
                if (value == _modes[1]) {
                  provider.changeTheme(ThemeMode.dark);
                }
              })
        ],
      ),
    );
  }
}
