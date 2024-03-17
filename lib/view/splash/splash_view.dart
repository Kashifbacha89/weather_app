import 'package:flutter/material.dart';
import 'package:weather_app/Resourses/Colors/app_colors.dart';
import 'package:weather_app/Resourses/images/image_assets.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(ImageAssets.nightStarRain,height: 200,width: 200,),
        ),
      ),
    );
  }
}
