import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:provider/provider.dart';

import '../../../Core/Utlis/AppColors.dart';

class CustomSebhaButton extends StatelessWidget {
   CustomSebhaButton({super.key,required this.onPressed,required this.prarer});
  void Function() onPressed;
  String prarer;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppConfigProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .25),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: provider.isDarkMode()
                ? AppColors.yellowColor
                : AppColors.primaryLightColor,
            minimumSize: Size(width, height *.06),
          ),
         onPressed: onPressed,
          child: Text(
            prarer,
            style: theme.textTheme.displayMedium?.copyWith(
              color: provider.isDarkMode()
                  ? AppColors.blackColor
                  : AppColors.whiteColor,
              fontWeight: FontWeight.w600
            ),
          )),
    );
  }
}
