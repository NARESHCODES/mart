import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mart/view/home.dart';
import 'package:mart/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  checkAuth() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var id = preferences.getString("id");
    if (id != null) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.off(() => const HomeView());
      });
    } else {
      Future.delayed(const Duration(seconds: 5), () {
        Get.off(() => const LoginView());
      });
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Lottie.asset("images/splash.json", width: Get.size.width * 0.75),
    )));
  }
}
