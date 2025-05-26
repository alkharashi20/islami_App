import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamy_app/Core/AppProvider/AppConfigProvider.dart';
import 'package:islamy_app/Core/Utlis/AppAssets.dart';
import 'package:islamy_app/layout.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provide = Provider.of<AppConfigProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: provide.isDarkMode()
                  ? const AssetImage(ImageAssets.splah_dark_view)
                  : const AssetImage(ImageAssets.splash_view),
              fit: BoxFit.fill)),
    );
  }
}
