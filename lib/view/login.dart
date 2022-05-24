import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mart/util/app_color.dart';
import 'package:mart/util/app_size.dart';
import 'package:mart/widgets/verticalgap.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                TextButton(onPressed: () {}, child: const Text("Skip Now"))
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 200,
                        width: Get.size.width,
                        child: Lottie.asset("images/login.json")),
                    //email
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColor.textFieldBorderColor),
                          borderRadius: BorderRadius.circular(
                              AppSize.textFormFieldBorderRadius),
                          color: AppColor.textFieldBgColor),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email",
                            border: InputBorder.none),
                      ),
                    ),
                    const VGap(),
                    //password
                    Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColor.textFieldBorderColor),
                          borderRadius: BorderRadius.circular(
                              AppSize.textFormFieldBorderRadius),
                          color: AppColor.textFieldBgColor),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password",
                            border: InputBorder.none),
                      ),
                    ),
                    const VGap(),
                    SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.buttonColor),
                              foregroundColor: MaterialStateProperty.all(
                                  AppColor.textFieldBgColor)),
                          onPressed: () {},
                          child: const Text("Login"),
                        ))
                  ],
                ),
              ),
            )));
  }
}
