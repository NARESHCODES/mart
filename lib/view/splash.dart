import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Lottie.asset("images/splash.json", width: Get.size.width * 0.75),
    )));
  }
}
