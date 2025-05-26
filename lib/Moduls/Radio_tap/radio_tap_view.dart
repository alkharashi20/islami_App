import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';
import 'package:islamy_app/Core/Utlis/AppColors.dart';
import 'package:provider/provider.dart';

class RadioTapView extends StatelessWidget {
  const RadioTapView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(ImageAssets.radio_image),
        Text(
          "إذاعه القرآن الكريم",
          style: theme.textTheme.bodyMedium,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageIcon(
             const AssetImage(ImageAssets.icon_previous),
              color: provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
            ),
            ImageIcon(
              const AssetImage(ImageAssets.icon_radio_paly),
              color: provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
            ),
            ImageIcon(
             const AssetImage(ImageAssets.icon_next),
              color: provider.isDarkMode()
                  ? AppColors.yellowColor
                  : AppColors.primaryLightColor,
            )
          ],
        )
      ],
    );
  }
}
