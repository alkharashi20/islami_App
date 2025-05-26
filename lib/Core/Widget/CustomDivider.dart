import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppProvider/AppConfigProvider.dart';
import '../Utlis/AppColors.dart';

class CustomDivider extends StatelessWidget {
   CustomDivider({super.key,this.thickness=3});
  double thickness;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Divider(
      color: provider.isDarkMode()
          ? AppColors.yellowColor
          : AppColors.primaryLightColor,
      thickness:thickness ,
    );
  }
}
